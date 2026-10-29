using System;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblMessage.Text = string.Empty;
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        try
        {
            DataTable adminResult = DbHelper.GetDataTable(
                "SELECT UserName FROM Admin WHERE UserName=@UserName AND Password=@Password",
                new SqlParameter("@UserName", username),
                new SqlParameter("@Password", password)
            );

            if (adminResult.Rows.Count > 0)
            {
                Session["Role"] = "Admin";
                Session["UserName"] = username;
                Response.Redirect("AdminDashboard.aspx");
                return;
            }

            DataTable userResult = DbHelper.GetDataTable(
                "SELECT AccountNo, Name, UserName FROM [User] WHERE UserName=@UserName AND Password=@Password",
                new SqlParameter("@UserName", username),
                new SqlParameter("@Password", password)
            );

            if (userResult.Rows.Count > 0)
            {
                Session["Role"] = "User";
                Session["AccountNo"] = Convert.ToInt32(userResult.Rows[0]["AccountNo"]);
                Session["Name"] = userResult.Rows[0]["Name"].ToString();
                Session["UserName"] = userResult.Rows[0]["UserName"].ToString();
                Response.Redirect("UserDashboard.aspx");
                return;
            }

            lblMessage.CssClass = "message-error";
            lblMessage.Text = "Invalid username or password.";
        }
        catch (Exception ex)
        {
            lblMessage.CssClass = "message-error";
            lblMessage.Text = "Login failed. " + ex.Message;
        }
    }
}
