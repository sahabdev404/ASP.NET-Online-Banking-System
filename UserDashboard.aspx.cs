using System;
using System.Data;
using System.Data.SqlClient;

public partial class User_UserDashboard : System.Web.UI.Page
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
            LoadUserData();
        }
    }

    private void LoadUserData()
    {
        int accountNo = Convert.ToInt32(Session["AccountNo"]);

        DataTable dt = DbHelper.GetDataTable(
            "SELECT Name, UserName, Balance FROM [User] WHERE AccountNo=@AccountNo",
            new SqlParameter("@AccountNo", accountNo));

        if (dt.Rows.Count == 0)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        lblName.Text = dt.Rows[0]["Name"].ToString();
        lblUsername.Text = dt.Rows[0]["UserName"].ToString();
        lblAccountNo.Text = accountNo.ToString();
        lblBalance.Text = Convert.ToDecimal(dt.Rows[0]["Balance"]).ToString("0.00");
    }
}
