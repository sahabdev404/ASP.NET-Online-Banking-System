using System;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string role = Session["Role"] as string;
            string username = Session["UserName"] as string;

            bool isLoggedIn = !string.IsNullOrEmpty(role) && !string.IsNullOrEmpty(username);
            lnkLogin.Visible = !isLoggedIn;
            btnLogout.Visible = isLoggedIn;
            lblWelcome.Text = isLoggedIn ? "Hello, " + username : string.Empty;

            phAdminLinks.Visible = role == "Admin";
            phUserLinks.Visible = role == "User";
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Login.aspx");
    }
}
