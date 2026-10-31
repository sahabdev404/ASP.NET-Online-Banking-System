using System;
using System.Data.SqlClient;

public partial class User_Withdraw : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "User")
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btnWithdraw_Click(object sender, EventArgs e)
    {
        decimal amount;
        if (!decimal.TryParse(txtAmount.Text.Trim(), out amount) || amount <= 0)
        {
            lblMessage.CssClass = "message-error";
            lblMessage.Text = "Please enter a valid amount.";
            return;
        }

        int accountNo = Convert.ToInt32(Session["AccountNo"]);
        using (SqlConnection con = DbHelper.GetConnection())
        {
            con.Open();
            SqlTransaction tran = con.BeginTransaction();
            try
            {
                SqlCommand cmdCheck = new SqlCommand("SELECT Balance FROM [User] WHERE AccountNo=@AccountNo", con, tran);
                cmdCheck.Parameters.AddWithValue("@AccountNo", accountNo);
                decimal currentBalance = Convert.ToDecimal(cmdCheck.ExecuteScalar());

                if (currentBalance < amount)
                {
                    lblMessage.CssClass = "message-error";
                    lblMessage.Text = "Insufficient balance.";
                    tran.Rollback();
                    return;
                }

                SqlCommand cmdUpdate = new SqlCommand("UPDATE [User] SET Balance = Balance - @Amount WHERE AccountNo=@AccountNo", con, tran);
                cmdUpdate.Parameters.AddWithValue("@Amount", amount);
                cmdUpdate.Parameters.AddWithValue("@AccountNo", accountNo);
                cmdUpdate.ExecuteNonQuery();

                SqlCommand cmdInsert = new SqlCommand("INSERT INTO Transactions(AccountNo, Type, Amount, Date) VALUES(@AccountNo,'Withdraw',@Amount,GETDATE())", con, tran);
                cmdInsert.Parameters.AddWithValue("@AccountNo", accountNo);
                cmdInsert.Parameters.AddWithValue("@Amount", amount);
                cmdInsert.ExecuteNonQuery();

                tran.Commit();
                lblMessage.CssClass = "message-success";
                lblMessage.Text = "Amount withdrawn successfully.";
                txtAmount.Text = "";
            }
            catch (Exception ex)
            {
                tran.Rollback();
                lblMessage.CssClass = "message-error";
                lblMessage.Text = "Withdraw failed: " + ex.Message;
            }
        }
    }
}
