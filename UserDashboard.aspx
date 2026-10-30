<%@ Page Title="User Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="UserDashboard.aspx.cs" Inherits="User_UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .dashboard-container {
        padding: 20px 0;
    }

    /* HEADER */

    .dashboard-header {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        padding: 35px;
        border-radius: 16px;
        margin-bottom: 28px;
    }

    .dashboard-header h2 {
        margin: 0 0 10px;
        font-size: 36px;
    }

    .dashboard-header p {
        margin: 0;
        color: #e4ecff;
        line-height: 1.7;
    }

    /* STATS */

    .dashboard-stats {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 18px;
        margin-bottom: 30px;
    }

    .stat-card {
        background: white;
        border-radius: 14px;
        padding: 24px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        border-top: 4px solid #d4a017;
    }

    .stat-card h4 {
        margin: 0 0 10px;
        color: #666;
        font-size: 15px;
    }

    .stat-card p {
        margin: 0;
        font-size: 24px;
        font-weight: bold;
        color: #0f3e89;
        word-break: break-word;
    }

    /* ACTION CARDS */

    .dashboard-actions {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 18px;
    }

    .action-card {
        background: white;
        padding: 25px;
        border-radius: 14px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        text-align: center;
        transition: 0.2s;
    }

    .action-card:hover {
        transform: translateY(-3px);
    }

    .action-card h3 {
        margin-top: 0;
        color: #0f3e89;
    }

    .action-card p {
        color: #666;
        line-height: 1.6;
        margin-bottom: 20px;
    }

    .dashboard-btn {
        display: inline-block;
        background: #d4a017;
        color: white;
        padding: 10px 20px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
    }

    .dashboard-btn:hover {
        background: #b88910;
    }

</style>

<div class="container dashboard-container">

    <!-- HEADER -->

    <div class="dashboard-header">

        <h2>User Dashboard</h2>

        <p>
            Manage your banking activities including deposits,
            withdrawals, transfers, and transaction history.
        </p>

    </div>

    <!-- USER INFO -->

    <div class="dashboard-stats">

        <div class="stat-card">

            <h4>Name</h4>

            <p>
                <asp:Label ID="lblName" runat="server" />
            </p>

        </div>

        <div class="stat-card">

            <h4>Username</h4>

            <p>
                <asp:Label ID="lblUsername" runat="server" />
            </p>

        </div>

        <div class="stat-card">

            <h4>Account No</h4>

            <p>
                <asp:Label ID="lblAccountNo" runat="server" />
            </p>

        </div>

        <div class="stat-card">

            <h4>Current Balance</h4>

            <p>
                ₹ <asp:Label ID="lblBalance" runat="server" />
            </p>

        </div>

    </div>

    <!-- ACTIONS -->

    <div class="dashboard-actions">

        <div class="action-card">

            <h3>Deposit</h3>

            <p>
                Add money securely to your account balance.
            </p>

            <a class="dashboard-btn" href="Deposit.aspx">
                Deposit Money
            </a>

        </div>

        <div class="action-card">

            <h3>Withdraw</h3>

            <p>
                Withdraw money safely from your account.
            </p>

            <a class="dashboard-btn" href="Withdraw.aspx">
                Withdraw Money
            </a>

        </div>

        <div class="action-card">

            <h3>Transfer</h3>

            <p>
                Transfer money to another valid account.
            </p>

            <a class="dashboard-btn" href="Transfer.aspx">
                Transfer Money
            </a>

        </div>

        <div class="action-card">

            <h3>History</h3>

            <p>
                View your complete transaction history.
            </p>

            <a class="dashboard-btn" href="TransactionHistory.aspx">
                View History
            </a>

        </div>

    </div>

</div>

</asp:Content>