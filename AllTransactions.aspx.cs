using System;
using System.Data;

public partial class Admin_AllTransactions : System.Web.UI.Page
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
            BindTransactions();
        }
    }

    private void BindTransactions()
    {
        DataTable dt = DbHelper.GetDataTable(
            "SELECT Id, AccountNo, Type, Amount, Date FROM Transactions ORDER BY Date DESC");
        gvTransactions.DataSource = dt;
        gvTransactions.DataBind();
    }
}
