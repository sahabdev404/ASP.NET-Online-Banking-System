using System;
using System.Data.SqlClient;

public partial class Admin_CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
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
                "INSERT INTO [User](Name, UserName, Password, Balance) VALUES(@Name,@UserName,@Password,@Balance)",
                new SqlParameter("@Name", txtName.Text.Trim()),
                new SqlParameter("@UserName", txtUsername.Text.Trim()),
                new SqlParameter("@Password", txtPassword.Text.Trim()),
                new SqlParameter("@Balance", balance)
            );

            lblMessage.CssClass = rows > 0 ? "message-success" : "message-error";
            lblMessage.Text = rows > 0 ? "User account created successfully." : "Unable to create user.";
        }
        catch (Exception ex)
        {
            lblMessage.CssClass = "message-error";
            lblMessage.Text = "Error: " + ex.Message;
        }
    }
}
