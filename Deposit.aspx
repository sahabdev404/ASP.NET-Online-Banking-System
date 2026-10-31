<%@ Page Title="Deposit Money" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Deposit.aspx.cs" Inherits="User_Deposit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .deposit-container {
        max-width: 700px;
        margin: 25px auto;
    }

    .deposit-card {
        background: #fff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    }

    /* HEADER */

    .deposit-header {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        padding: 30px;
    }

    .deposit-header h2 {
        margin: 0 0 10px;
        font-size: 32px;
    }

    .deposit-header p {
        margin: 0;
        color: #e4ecff;
        line-height: 1.7;
    }

    /* BODY */

    .deposit-body {
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

    .deposit-input {
        width: 100%;
        height: 48px;
        border: 1px solid #ccd6f0;
        border-radius: 8px;
        padding: 0 14px;
        font-size: 15px;
    }

    .deposit-input:focus {
        outline: none;
        border-color: #d4a017;
        box-shadow: 0 0 0 3px rgba(212,160,23,0.15);
    }

    .validator {
        color: #d11a2a;
        font-size: 13px;
    }

    .deposit-btn {
        background: #d4a017;
        color: white;
        border: none;
        padding: 12px 24px;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
    }

    .deposit-btn:hover {
        background: #b88910;
    }

</style>

<div class="container deposit-container">

    <div class="deposit-card">

        <!-- HEADER -->

        <div class="deposit-header">

            <h2>Deposit Money</h2>

            <p>
                Add money securely to your bank account balance.
            </p>

        </div>

        <!-- BODY -->

        <div class="deposit-body">

            <asp:Label ID="lblMessage" runat="server" />

            <div class="input-group">

                <label>Deposit Amount</label>

                <asp:TextBox
                    ID="txtAmount"
                    runat="server"
                    CssClass="deposit-input"
                    placeholder="Enter Deposit Amount">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    runat="server"
                    ControlToValidate="txtAmount"
                    ErrorMessage="Amount is required."
                    CssClass="validator">
                </asp:RequiredFieldValidator>

            </div>

            <asp:Button
                ID="btnDeposit"
                runat="server"
                Text="Deposit Money"
                CssClass="deposit-btn"
                OnClick="btnDeposit_Click" />

        </div>

    </div>

</div>

</asp:Content>