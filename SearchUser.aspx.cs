using System;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_SearchUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string keyword = txtKeyword.Text.Trim();
        if (string.IsNullOrEmpty(keyword))
        {
            lblMessage.CssClass = "message-error";
            lblMessage.Text = "Enter search value.";
            return;
        }

        DataTable dt = DbHelper.GetDataTable(
            "SELECT AccountNo, Name, UserName, Balance FROM [User] WHERE CAST(AccountNo AS VARCHAR(20))=@Keyword OR UserName=@Keyword",
            new SqlParameter("@Keyword", keyword));

        gvSearchResult.DataSource = dt;
        gvSearchResult.DataBind();

        lblMessage.CssClass = dt.Rows.Count > 0 ? "message-success" : "message-error";
        lblMessage.Text = dt.Rows.Count > 0 ? "User found." : "No user found.";
    }
}
