<%@ Page Title="Transaction History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="TransactionHistory.aspx.cs" Inherits="User_TransactionHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .history-container {
        margin-top: 20px;
    }

    .history-card {
        background: #fff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    }

    /* HEADER */

    .history-header {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        padding: 30px;
    }

    .history-header h2 {
        margin: 0 0 10px;
        font-size: 32px;
    }

    .history-header p {
        margin: 0;
        color: #e4ecff;
        line-height: 1.7;
    }

    /* BODY */

    .history-body {
        padding: 25px;
        overflow-x: auto;
    }

    /* GRIDVIEW */

    .history-grid {
        width: 100%;
        border-collapse: collapse;
        min-width: 700px;
    }

    .history-grid th {
        background: #0f3e89;
        color: white;
        padding: 12px;
        text-align: left;
        font-size: 14px;
    }

    .history-grid td {
        padding: 12px;
        border-bottom: 1px solid #e4e8f3;
        font-size: 14px;
        color: #333;
    }

    .history-grid tr:nth-child(even) {
        background: #f8faff;
    }

    .history-grid tr:hover {
        background: #eef4ff;
    }

</style>

<div class="container history-container">

    <div class="history-card">

        <!-- HEADER -->

        <div class="history-header">

            <h2>Transaction History</h2>

            <p>
                View your deposits, withdrawals, and money transfer records.
            </p>

        </div>

        <!-- BODY -->

        <div class="history-body">

            <asp:GridView
                ID="gvHistory"
                runat="server"
                AutoGenerateColumns="True"
                CssClass="history-grid">
            </asp:GridView>

        </div>

    </div>

</div>

</asp:Content>