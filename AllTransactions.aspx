<%@ Page Title="All Transactions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AllTransactions.aspx.cs" Inherits="Admin_AllTransactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .transaction-box {
        background: #fff;
        border-radius: 14px;
        overflow: hidden;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        margin-top: 20px;
    }

    /* HEADER */

    .transaction-header {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        padding: 25px 30px;
    }

    .transaction-header h2 {
        margin: 0 0 8px;
        font-size: 30px;
    }

    .transaction-header p {
        margin: 0;
        color: #e4ecff;
        font-size: 15px;
    }

    /* BODY */

    .transaction-body {
        padding: 25px;
        overflow-x: auto;
    }

    /* GRIDVIEW */

    .transaction-grid {
        width: 100%;
        border-collapse: collapse;
        min-width: 700px;
    }

    .transaction-grid th {
        background: #0f3e89;
        color: white;
        padding: 12px;
        text-align: left;
        font-size: 14px;
    }

    .transaction-grid td {
        padding: 12px;
        border-bottom: 1px solid #e4e8f3;
        font-size: 14px;
        color: #333;
    }

    .transaction-grid tr:nth-child(even) {
        background: #f8faff;
    }

    .transaction-grid tr:hover {
        background: #eef4ff;
    }

</style>

<div class="container">

    <div class="transaction-box">

        <!-- HEADER -->

        <div class="transaction-header">

            <h2>All Transactions</h2>

            <p>
                View all deposits, withdrawals, and money transfers.
            </p>

        </div>

        <!-- BODY -->

        <div class="transaction-body">

            <asp:GridView
                ID="gvTransactions"
                runat="server"
                AutoGenerateColumns="True"
                CssClass="transaction-grid">
            </asp:GridView>

        </div>

    </div>

</div>

</asp:Content>