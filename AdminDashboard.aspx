<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="Admin_AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .dashboard-box {
        padding: 20px 0;
    }

    .dashboard-header {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        padding: 30px;
        border-radius: 14px;
        margin-bottom: 25px;
    }

    .dashboard-header h2 {
        margin: 0 0 10px;
        font-size: 34px;
    }

    .dashboard-header p {
        margin: 0;
        line-height: 1.7;
        color: #e4ecff;
    }

    /* STAT BOX */

    .dashboard-stats {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 18px;
        margin-bottom: 28px;
    }

    .stat-card {
        background: #fff;
        padding: 24px;
        border-radius: 14px;
        border-top: 4px solid #d4a017;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    }

    .stat-card h4 {
        margin: 0 0 10px;
        color: #666;
        font-size: 15px;
    }

    .stat-card p {
        margin: 0;
        font-size: 32px;
        font-weight: bold;
        color: #0f3e89;
    }

    /* ACTION BOX */

    .dashboard-actions {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 18px;
    }

    .action-card {
        background: #fff;
        padding: 25px;
        border-radius: 14px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        text-align: center;
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
        padding: 10px 20px;
        background: #d4a017;
        color: #fff;
        text-decoration: none;
        border-radius: 8px;
        font-weight: 600;
    }

    .dashboard-btn:hover {
        background: #b88910;
    }

</style>

<div class="container dashboard-box">

    <!-- HEADER -->

    <div class="dashboard-header">

        <h2>Admin Dashboard</h2>

        <p>
            Manage users, monitor transactions, and control
            the online banking system from this dashboard.
        </p>

    </div>

    <!-- STATS -->

    <div class="dashboard-stats">

        <div class="stat-card">

            <h4>Total Users</h4>

            <p>
                <asp:Label ID="lblTotalUsers" runat="server" Text="0" />
            </p>

        </div>

        <div class="stat-card">

            <h4>Total Transactions</h4>

            <p>
                <asp:Label ID="lblTotalTransactions" runat="server" Text="0" />
            </p>

        </div>

        <div class="stat-card">

            <h4>Total Balance</h4>

            <p>
                ₹ <asp:Label ID="lblTotalBalance" runat="server" Text="0" />
            </p>

        </div>

    </div>

    <!-- ACTIONS -->

    <div class="dashboard-actions">

        <div class="action-card">

            <h3>Create User</h3>

            <p>
                Add new users and create bank accounts.
            </p>

            <a class="dashboard-btn" href="CreateUser.aspx">
                Open
            </a>

        </div>

        <div class="action-card">

            <h3>Manage Users</h3>

            <p>
                View and manage all registered users.
            </p>

            <a class="dashboard-btn" href="ManageUsers.aspx">
                Manage
            </a>

        </div>

        <div class="action-card">

            <h3>Transactions</h3>

            <p>
                Check deposits, withdrawals, and transfers.
            </p>

            <a class="dashboard-btn" href="AllTransactions.aspx">
                View
            </a>

        </div>

    </div>

</div>

</asp:Content>