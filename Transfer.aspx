<%@ Page Title="Transfer Money" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Transfer.aspx.cs" Inherits="User_Transfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .transfer-container {
        max-width: 700px;
        margin: 25px auto;
    }

    .transfer-card {
        background: #fff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    }

    /* HEADER */

    .transfer-header {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        padding: 30px;
    }

    .transfer-header h2 {
        margin: 0 0 10px;
        font-size: 32px;
    }

    .transfer-header p {
        margin: 0;
        color: #e4ecff;
        line-height: 1.7;
    }

    /* BODY */

    .transfer-body {
        padding: 30px;
    }

    .input-group {
        margin-bottom: 20px;
    }

    .input-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #333;
    }

    .transfer-input {
        width: 100%;
        height: 48px;
        border: 1px solid #ccd6f0;
        border-radius: 8px;
        padding: 0 14px;
        font-size: 15px;
    }

    .transfer-input:focus {
        outline: none;
        border-color: #d4a017;
        box-shadow: 0 0 0 3px rgba(212,160,23,0.15);
    }

    .validator {
        color: #d11a2a;
        font-size: 13px;
    }

    .transfer-btn {
        background: #d4a017;
        color: white;
        border: none;
        padding: 12px 24px;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
    }

    .transfer-btn:hover {
        background: #b88910;
    }

</style>

<div class="container transfer-container">

    <div class="transfer-card">

        <!-- HEADER -->

        <div class="transfer-header">

            <h2>Transfer Money</h2>

            <p>
                Send money securely to another bank account instantly.
            </p>

        </div>

        <!-- BODY -->

        <div class="transfer-body">

            <asp:Label ID="lblMessage" runat="server" />

            <!-- ACCOUNT -->

            <div class="input-group">

                <label>Receiver Account Number</label>

                <asp:TextBox
                    ID="txtReceiverAccountNo"
                    runat="server"
                    CssClass="transfer-input"
                    placeholder="Enter Receiver Account Number">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    runat="server"
                    ControlToValidate="txtReceiverAccountNo"
                    ErrorMessage="Receiver account is required."
                    CssClass="validator">
                </asp:RequiredFieldValidator>

            </div>

            <!-- AMOUNT -->

            <div class="input-group">

                <label>Amount</label>

                <asp:TextBox
                    ID="txtAmount"
                    runat="server"
                    CssClass="transfer-input"
                    placeholder="Enter Amount">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    runat="server"
                    ControlToValidate="txtAmount"
                    ErrorMessage="Amount is required."
                    CssClass="validator">
                </asp:RequiredFieldValidator>

            </div>

            <!-- BUTTON -->

            <asp:Button
                ID="btnTransfer"
                runat="server"
                Text="Transfer Money"
                CssClass="transfer-btn"
                OnClick="btnTransfer_Click" />

        </div>

    </div>

</div>

</asp:Content>