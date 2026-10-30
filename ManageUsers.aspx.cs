using System;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_ManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!IsPostBack) BindUsers();
    }

    private void BindUsers(string search = "")
    {
        string query = "SELECT AccountNo, Name, UserName, Balance FROM [User]";
        DataTable dt;
        if (string.IsNullOrWhiteSpace(search))
        {
            dt = DbHelper.GetDataTable(query + " ORDER BY AccountNo");
        }
        else
        {
            dt = DbHelper.GetDataTable(
                query + " WHERE CAST(AccountNo AS VARCHAR(20)) LIKE @Search OR UserName LIKE @Search ORDER BY AccountNo",
                new SqlParameter("@Search", "%" + search + "%"));
        }
        gvUsers.DataSource = dt;
        gvUsers.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e) { BindUsers(txtSearch.Text.Trim()); }
    protected void btnReset_Click(object sender, EventArgs e) { txtSearch.Text = ""; BindUsers(); }

    protected void gvUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        int accountNo;
        if (!int.TryParse(e.CommandArgument.ToString(), out accountNo)) return;

        if (e.CommandName == "EditUser")
        {
            Response.Redirect("UpdateUser.aspx?acc=" + accountNo);
        }
        else if (e.CommandName == "DeleteUser")
        {
            try
            {
                DbHelper.ExecuteNonQuery("DELETE FROM [User] WHERE AccountNo=@AccountNo",
                    new SqlParameter("@AccountNo", accountNo));
                lblMessage.CssClass = "message-success";
                lblMessage.Text = "User deleted successfully.";
                BindUsers(txtSearch.Text.Trim());
            }
            catch (Exception ex)
            {
                lblMessage.CssClass = "message-error";
                lblMessage.Text = "Delete failed: " + ex.Message;
            }
        }
    }
}
