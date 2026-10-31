using System;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_UpdateUser : System.Web.UI.Page
{
    private int accountNo;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        if (!int.TryParse(Request.QueryString["acc"], out accountNo))
        {
            Response.Redirect("ManageUsers.aspx");
            return;
        }

        if (!IsPostBack) LoadUser();
    }

    private void LoadUser()
    {
        DataTable dt = DbHelper.GetDataTable(
            "SELECT AccountNo, Name, UserName, Password, Balance FROM [User] WHERE AccountNo=@AccountNo",
            new SqlParameter("@AccountNo", accountNo));

        if (dt.Rows.Count == 0)
        {
            Response.Redirect("ManageUsers.aspx");
            return;
        }

        DataRow row = dt.Rows[0];
        txtAccountNo.Text = row["AccountNo"].ToString();
        txtName.Text = row["Name"].ToString();
        txtUsername.Text = row["UserName"].ToString();
        txtPassword.Text = row["Password"].ToString();
        txtBalance.Text = Convert.ToDecimal(row["Balance"]).ToString("0.00");
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        decimal balance;
        if (!decimal.TryParse(txtBalance.Text.Trim(), out balance) || balance < 0)
        {
            lblMessage.CssClass = "message-error";
            lblMessage.Text = "Enter a valid balance.";
            return;
        }

        try
        {
            int rows = DbHelper.ExecuteNonQuery(
                "UPDATE [User] SET Name=@Name, UserName=@UserName, Password=@Password, Balance=@Balance WHERE AccountNo=@AccountNo",
                new SqlParameter("@Name", txtName.Text.Trim()),
                new SqlParameter("@UserName", txtUsername.Text.Trim()),
                new SqlParameter("@Password", txtPassword.Text.Trim()),
                new SqlParameter("@Balance", balance),
                new SqlParameter("@AccountNo", accountNo));

            lblMessage.CssClass = rows > 0 ? "message-success" : "message-error";
            lblMessage.Text = rows > 0 ? "User updated successfully." : "Update failed.";
        }
        catch (Exception ex)
        {
            lblMessage.CssClass = "message-error";
            lblMessage.Text = "Error: " + ex.Message;
        }
    }
}
