<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    body {
        background: #f4f6fb;
    }

    .login-page {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 40px 0;
    }

    .login-box {
        width: 100%;
        max-width: 1100px;
        min-height: 580px;
        background: #fff;
        border-radius: 24px;
        overflow: hidden;
        display: grid;
        grid-template-columns: 1fr 1fr;
        box-shadow: 0 18px 45px rgba(0,0,0,0.12);
    }

    /* LEFT SIDE */

    .login-left {
        background: linear-gradient(145deg, #0c1f46, #144b8a);
        padding: 60px;
        position: relative;
        display: flex;
        align-items: center;
        overflow: hidden;
    }

    .login-left::before {
        content: "";
        position: absolute;
        width: 360px;
        height: 360px;
        background: rgba(255,215,0,0.10);
        border-radius: 50%;
        top: -140px;
        right: -90px;
    }

    .login-left::after {
        content: "";
        position: absolute;
        width: 220px;
        height: 220px;
        background: rgba(255,255,255,0.06);
        border-radius: 50%;
        bottom: -70px;
        left: -60px;
    }

    .login-content {
        position: relative;
        z-index: 2;
        color: #fff;
    }

    .login-badge {
        display: inline-block;
        background: rgba(255,215,0,0.18);
        color: #ffd95c;
        padding: 9px 18px;
        border-radius: 30px;
        font-size: 14px;
        font-weight: 700;
        margin-bottom: 22px;
        border: 1px solid rgba(255,215,0,0.25);
    }

    .login-content h1 {
        margin: 0 0 18px;
        font-size: 52px;
        line-height: 1.2;
    }

    .login-content p {
        font-size: 16px;
        line-height: 1.8;
        color: #dce5ff;
        max-width: 430px;
    }

    .login-features {
        margin-top: 35px;
    }

    .feature-item {
        background: rgba(255,255,255,0.10);
        padding: 15px 18px;
        border-radius: 12px;
        margin-bottom: 14px;
        font-weight: 600;
        border-left: 4px solid #ffd700;
        backdrop-filter: blur(5px);
    }

    /* RIGHT SIDE */

    .login-right {
        background: #f8faff;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 45px;
    }

    .login-card {
        width: 100%;
        max-width: 420px;
        background: #fff;
        padding: 38px;
        border-radius: 20px;
        border-top: 5px solid #d4a017;
        box-shadow: 0 12px 35px rgba(0,0,0,0.08);
    }

    .login-card h2 {
        text-align: center;
        margin-top: 0;
        margin-bottom: 30px;
        color: #0c1f46;
        font-size: 34px;
        font-weight: 800;
    }

    .input-group {
        margin-bottom: 20px;
    }

    .input-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: 700;
        color: #1f2a44;
    }

    .login-input {
        width: 100%;
        height: 52px;
        border: 1px solid #d5ddef;
        border-radius: 12px;
        padding: 0 14px;
        font-size: 15px;
        transition: 0.2s;
    }

    .login-input:focus {
        outline: none;
        border-color: #d4a017;
        box-shadow: 0 0 0 4px rgba(212,160,23,0.18);
    }

    .validator {
        color: #d11a2a;
        font-size: 13px;
    }

    .login-btn-wrap {
        margin-top: 24px;
    }

    .login-btn {
        width: 100%;
        height: 54px;
        border: none;
        border-radius: 12px;
        background: linear-gradient(145deg, #d4a017, #f5cb4d);
        color: #0c1f46;
        font-size: 16px;
        font-weight: 800;
        cursor: pointer;
        transition: 0.25s;
    }

    .login-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 14px 24px rgba(212,160,23,0.28);
    }

    .bank-note {
        margin-top: 22px;
        text-align: center;
        color: #6c7690;
        font-size: 14px;
    }

    @media (max-width: 900px) {

        .login-box {
            grid-template-columns: 1fr;
        }

        .login-left {
            padding: 40px 30px;
        }

        .login-right {
            padding: 30px 20px;
        }

        .login-content h1 {
            font-size: 38px;
        }

    }

</style>

<div class="login-page">

    <div class="login-box">

        <!-- LEFT -->

        <div class="login-left">

            <div class="login-content">

                <span class="login-badge">
                    BankCC Secure Access
                </span>

                <h1>
                    Welcome Back
                </h1>

                <p>
                    Securely login to manage your deposits,
                    withdrawals, transfers, and transaction history
                    anytime from anywhere.
                </p>

                <div class="login-features">

                    <div class="feature-item">
                        ✓ Secure Banking Authentication
                    </div>

                    <div class="feature-item">
                        ✓ Fast Money Transfer System
                    </div>

                    <div class="feature-item">
                        ✓ 24/7 Online Banking Access
                    </div>

                </div>

            </div>

        </div>

        <!-- RIGHT -->

        <div class="login-right">

            <div class="login-card">

                <h2>Login Account</h2>

                <asp:Label ID="lblMessage" runat="server" />

                <div class="input-group">

                    <label>Username</label>

                    <asp:TextBox
                        ID="txtUsername"
                        runat="server"
                        CssClass="login-input"
                        placeholder="Enter Username">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="rfvUser"
                        runat="server"
                        ControlToValidate="txtUsername"
                        ErrorMessage="Username is required."
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>

                </div>

                <div class="input-group">

                    <label>Password</label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="login-input"
                        placeholder="Enter Password">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="rfvPass"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        CssClass="validator"
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>

                </div>

                <div class="login-btn-wrap">

                    <asp:Button
                        ID="btnLogin"
                        runat="server"
                        Text="Login Now"
                        CssClass="login-btn"
                        OnClick="btnLogin_Click" />

                </div>

                <div class="bank-note">
                    BankCC Online Banking System
                </div>

            </div>

        </div>

    </div>

</div>

</asp:Content>