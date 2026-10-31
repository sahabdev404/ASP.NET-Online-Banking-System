using System;
using System.Data;
using System.Data.SqlClient;

public partial class User_TransactionHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "User")
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            BindHistory();
        }
    }

    private void BindHistory()
    {
        int accountNo = Convert.ToInt32(Session["AccountNo"]);
        DataTable dt = DbHelper.GetDataTable(
            "SELECT Id, AccountNo, Type, Amount, Date FROM Transactions WHERE AccountNo=@AccountNo ORDER BY Date DESC",
            new SqlParameter("@AccountNo", accountNo));
        gvHistory.DataSource = dt;
        gvHistory.DataBind();
    }
}
