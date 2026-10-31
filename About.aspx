<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .about-container {
        max-width: 950px;
        margin: 20px auto;
    }

    .about-card {
        background: #fff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    }

    /* HEADER */

    .about-header {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        padding: 35px;
    }

    .about-header h2 {
        margin: 0 0 10px;
        font-size: 34px;
    }

    .about-header p {
        margin: 0;
        color: #e4ecff;
        line-height: 1.7;
    }

    /* BODY */

    .about-body {
        padding: 35px;
    }

    .about-section {
        margin-bottom: 28px;
    }

    .about-section h3 {
        margin-top: 0;
        margin-bottom: 12px;
        color: #0f3e89;
        font-size: 24px;
    }

    .about-section p {
        color: #555;
        line-height: 1.8;
        margin: 0;
    }

    /* FEATURE BOX */

    .feature-boxes {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 18px;
        margin-top: 25px;
    }

    .feature-box {
        background: #f8faff;
        border-radius: 12px;
        padding: 22px;
        border-top: 4px solid #d4a017;
    }

    .feature-box h4 {
        margin-top: 0;
        color: #0f3e89;
    }

    .feature-box p {
        color: #666;
        line-height: 1.7;
        margin-bottom: 0;
    }

</style>

<div class="container about-container">

    <div class="about-card">

        <!-- HEADER -->

        <div class="about-header">

            <h2>About BankCC</h2>

            <p>
                Secure and simple online banking system developed using
                ASP.NET Web Forms and SQL Server.
            </p>

        </div>

        <!-- BODY -->

        <div class="about-body">

            <div class="about-section">

                <h3>Project Overview</h3>

                <p>
                    BankCC is an online banking management system designed
                    for secure and easy banking operations. Users can
                    deposit money, withdraw balance, transfer funds,
                    and check transaction history online.
                </p>

            </div>

            <div class="about-section">

                <h3>Technology Used</h3>

                <p>
                    This project is developed using ASP.NET Web Forms,
                    C#, .NET Framework, and SQL Server database with
                    role-based authentication and admin control.
                </p>

            </div>

            <!-- FEATURES -->

            <div class="feature-boxes">

                <div class="feature-box">

                    <h4>Secure Login</h4>

                    <p>
                        Protected user and admin authentication system.
                    </p>

                </div>

                <div class="feature-box">

                    <h4>Money Transfer</h4>

                    <p>
                        Secure balance transfer between bank accounts.
                    </p>

                </div>

                <div class="feature-box">

                    <h4>Transaction History</h4>

                    <p>
                        Users can monitor all banking activities easily.
                    </p>

                </div>

            </div>

        </div>

    </div>

</div>

</asp:Content>