using System;
using System.Data.SqlClient;

public partial class User_Transfer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "User")
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btnTransfer_Click(object sender, EventArgs e)
    {
        int receiverAccountNo;
        decimal amount;
        int senderAccountNo = Convert.ToInt32(Session["AccountNo"]);

        if (!int.TryParse(txtReceiverAccountNo.Text.Trim(), out receiverAccountNo))
        {
            lblMessage.CssClass = "message-error";
            lblMessage.Text = "Receiver account number is invalid.";
            return;
        }
        if (receiverAccountNo == senderAccountNo)
        {
            lblMessage.CssClass = "message-error";
            lblMessage.Text = "Cannot transfer to the same account.";
            return;
        }
        if (!decimal.TryParse(txtAmount.Text.Trim(), out amount) || amount <= 0)
        {
            lblMessage.CssClass = "message-error";
            lblMessage.Text = "Enter a valid amount.";
            return;
        }

        using (SqlConnection con = DbHelper.GetConnection())
        {
            con.Open();
            SqlTransaction tran = con.BeginTransaction();
            try
            {
                SqlCommand receiverExistsCmd = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE AccountNo=@AccountNo", con, tran);
                receiverExistsCmd.Parameters.AddWithValue("@AccountNo", receiverAccountNo);
                int receiverExists = Convert.ToInt32(receiverExistsCmd.ExecuteScalar());

                if (receiverExists == 0)
                {
                    lblMessage.CssClass = "message-error";
                    lblMessage.Text = "Receiver account does not exist.";
                    tran.Rollback();
                    return;
                }

                SqlCommand senderBalanceCmd = new SqlCommand("SELECT Balance FROM [User] WHERE AccountNo=@AccountNo", con, tran);
                senderBalanceCmd.Parameters.AddWithValue("@AccountNo", senderAccountNo);
                decimal senderBalance = Convert.ToDecimal(senderBalanceCmd.ExecuteScalar());

                if (senderBalance < amount)
                {
                    lblMessage.CssClass = "message-error";
                    lblMessage.Text = "Insufficient balance.";
                    tran.Rollback();
                    return;
                }

                SqlCommand debitCmd = new SqlCommand("UPDATE [User] SET Balance = Balance - @Amount WHERE AccountNo=@AccountNo", con, tran);
                debitCmd.Parameters.AddWithValue("@Amount", amount);
                debitCmd.Parameters.AddWithValue("@AccountNo", senderAccountNo);
                debitCmd.ExecuteNonQuery();

                SqlCommand creditCmd = new SqlCommand("UPDATE [User] SET Balance = Balance + @Amount WHERE AccountNo=@AccountNo", con, tran);
                creditCmd.Parameters.AddWithValue("@Amount", amount);
                creditCmd.Parameters.AddWithValue("@AccountNo", receiverAccountNo);
                creditCmd.ExecuteNonQuery();

                SqlCommand senderTranCmd = new SqlCommand(
                    "INSERT INTO Transactions(AccountNo, Type, Amount, Date) VALUES(@AccountNo,@Type,@Amount,GETDATE())", con, tran);
                senderTranCmd.Parameters.AddWithValue("@AccountNo", senderAccountNo);
                senderTranCmd.Parameters.AddWithValue("@Type", "Transfer To " + receiverAccountNo);
                senderTranCmd.Parameters.AddWithValue("@Amount", amount);
                senderTranCmd.ExecuteNonQuery();

                SqlCommand receiverTranCmd = new SqlCommand(
                    "INSERT INTO Transactions(AccountNo, Type, Amount, Date) VALUES(@AccountNo,@Type,@Amount,GETDATE())", con, tran);
                receiverTranCmd.Parameters.AddWithValue("@AccountNo", receiverAccountNo);
                receiverTranCmd.Parameters.AddWithValue("@Type", "Transfer From " + senderAccountNo);
                receiverTranCmd.Parameters.AddWithValue("@Amount", amount);
                receiverTranCmd.ExecuteNonQuery();

                tran.Commit();
                lblMessage.CssClass = "message-success";
                lblMessage.Text = "Transfer completed successfully.";
                txtReceiverAccountNo.Text = "";
                txtAmount.Text = "";
            }
            catch (Exception ex)
            {
                tran.Rollback();
                lblMessage.CssClass = "message-error";
                lblMessage.Text = "Transfer failed: " + ex.Message;
            }
        }
    }
}
