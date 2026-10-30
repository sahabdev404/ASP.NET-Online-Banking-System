using System;

public partial class Admin_AdminDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadStats();
        }
    }

    private void LoadStats()
    {
        try
        {
            object totalUsers = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM [User]");
            object totalTransactions = DbHelper.ExecuteScalar("SELECT COUNT(*) FROM Transactions");
            object totalBalance = DbHelper.ExecuteScalar("SELECT ISNULL(SUM(Balance),0) FROM [User]");

            lblTotalUsers.Text = totalUsers.ToString();
            lblTotalTransactions.Text = totalTransactions.ToString();
            lblTotalBalance.Text = Convert.ToDecimal(totalBalance).ToString("0.00");
        }
        catch
        {
            lblTotalUsers.Text = "Error";
            lblTotalTransactions.Text = "Error";
            lblTotalBalance.Text = "Error";
        }
    }
}
