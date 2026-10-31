<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    /* HERO */

    .hero {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        border-radius: 16px;
        padding: 45px;
        display: grid;
        grid-template-columns: 1.3fr 1fr;
        gap: 30px;
        align-items: center;
        margin-bottom: 35px;
    }

    .hero h1 {
        font-size: 42px;
        margin: 0 0 16px;
    }

    .hero p {
        line-height: 1.8;
        color: #e4ecff;
        margin-bottom: 24px;
    }

    .hero-btn {
        display: inline-block;
        background: #d4a017;
        color: white;
        padding: 12px 24px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
    }

    .hero-btn:hover {
        background: #b88910;
    }

    .hero-card {
        background: rgba(255,255,255,0.12);
        padding: 30px;
        border-radius: 14px;
        backdrop-filter: blur(5px);
    }

    .hero-card h3 {
        margin-top: 0;
        color: #ffd95c;
    }

    .hero-card p {
        margin-bottom: 0;
        color: #f1f5ff;
    }

    /* SECTION */

    .section-title {
        margin: 35px 0 18px;
        color: #0f3e89;
        font-size: 28px;
    }

    /* CARDS */

    .cards {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 18px;
    }

    .card {
        background: white;
        padding: 24px;
        border-radius: 14px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        border-top: 4px solid #d4a017;
        transition: 0.2s;
    }

    .card:hover {
        transform: translateY(-3px);
    }

    .card h3 {
        margin-top: 0;
        color: #0f3e89;
    }

    .card p {
        color: #555;
        line-height: 1.7;
    }

    @media (max-width: 900px) {

        .hero {
            grid-template-columns: 1fr;
            padding: 30px;
        }

        .hero h1 {
            font-size: 34px;
        }

    }

</style>

<div class="container">

    <!-- HERO -->

    <section class="hero">

        <div>

            <h1>
                Welcome to BankCC Online Banking
            </h1>

            <p>
                Manage your money securely with our online banking system.
                Deposit funds, withdraw money, transfer balance, and track
                transactions easily anytime.
            </p>

            <a class="hero-btn" href="Login.aspx">
                Login Account
            </a>

        </div>

        <div class="hero-card">

            <h3>Secure Banking</h3>

            <p>
                Protected login system with secure transactions,
                account monitoring, and safe banking services.
            </p>

        </div>

    </section>

    <!-- FEATURES -->

    <h2 class="section-title">
        Banking Features
    </h2>

    <div class="cards">

        <div class="card">

            <h3>Fast Deposits</h3>

            <p>
                Instantly add money to your account securely.
            </p>

        </div>

        <div class="card">

            <h3>Safe Withdrawals</h3>

            <p>
                Withdraw money safely with balance validation.
            </p>

        </div>

        <div class="card">

            <h3>Money Transfer</h3>

            <p>
                Transfer money securely to valid accounts.
            </p>

        </div>

        <div class="card">

            <h3>Transaction Tracking</h3>

            <p>
                Monitor all account activities anytime.
            </p>

        </div>

    </div>

    <!-- WHY CHOOSE -->

    <h2 class="section-title">
        Why Choose Us
    </h2>

    <div class="cards">

        <div class="card">

            <h3>Trusted Security</h3>

            <p>
                Advanced security system with protected login
                and safe user authentication.
            </p>

        </div>

        <div class="card">

            <h3>Simple Design</h3>

            <p>
                Clean and user friendly interface for all users.
            </p>

        </div>

        <div class="card">

            <h3>24/7 Access</h3>

            <p>
                Access your account anytime from anywhere.
            </p>

        </div>

    </div>

</div>

</asp:Content>