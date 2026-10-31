<%@ Page Title="Withdraw Money" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Withdraw.aspx.cs" Inherits="User_Withdraw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .withdraw-container {
        max-width: 700px;
        margin: 25px auto;
    }

    .withdraw-card {
        background: #fff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    }

    /* HEADER */

    .withdraw-header {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        padding: 30px;
    }

    .withdraw-header h2 {
        margin: 0 0 10px;
        font-size: 32px;
    }

    .withdraw-header p {
        margin: 0;
        color: #e4ecff;
        line-height: 1.7;
    }

    /* BODY */

    .withdraw-body {
        padding: 30px;
    }

    .input-group {
        margin-bottom: 22px;
    }

    .input-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #333;
    }

    .withdraw-input {
        width: 100%;
        height: 48px;
        border: 1px solid #ccd6f0;
        border-radius: 8px;
        padding: 0 14px;
        font-size: 15px;
    }

    .withdraw-input:focus {
        outline: none;
        border-color: #d4a017;
        box-shadow: 0 0 0 3px rgba(212,160,23,0.15);
    }

    .validator {
        color: #d11a2a;
        font-size: 13px;
    }

    .withdraw-btn {
        background: #d4a017;
        color: white;
        border: none;
        padding: 12px 24px;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
    }

    .withdraw-btn:hover {
        background: #b88910;
    }

</style>

<div class="container withdraw-container">

    <div class="withdraw-card">

        <!-- HEADER -->

        <div class="withdraw-header">

            <h2>Withdraw Money</h2>

            <p>
                Withdraw money securely from your bank account.
            </p>

        </div>

        <!-- BODY -->

        <div class="withdraw-body">

            <asp:Label ID="lblMessage" runat="server" />

            <div class="input-group">

                <label>Withdraw Amount</label>

                <asp:TextBox
                    ID="txtAmount"
                    runat="server"
                    CssClass="withdraw-input"
                    placeholder="Enter Withdraw Amount">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    runat="server"
                    ControlToValidate="txtAmount"
                    ErrorMessage="Amount is required."
                    CssClass="validator">
                </asp:RequiredFieldValidator>

            </div>

            <asp:Button
                ID="btnWithdraw"
                runat="server"
                Text="Withdraw Money"
                CssClass="withdraw-btn"
                OnClick="btnWithdraw_Click" />

        </div>

    </div>

</div>

</asp:Content>