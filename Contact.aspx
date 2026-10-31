<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .contact-container {
        max-width: 950px;
        margin: 20px auto;
    }

    .contact-card {
        background: #fff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    }

    /* HEADER */

    .contact-header {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        padding: 35px;
    }

    .contact-header h2 {
        margin: 0 0 10px;
        font-size: 34px;
    }

    .contact-header p {
        margin: 0;
        color: #e4ecff;
        line-height: 1.7;
    }

    /* BODY */

    .contact-body {
        padding: 35px;
    }

    .contact-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 20px;
    }

    .contact-box {
        background: #f8faff;
        border-radius: 14px;
        padding: 24px;
        border-top: 4px solid #d4a017;
    }

    .contact-box h3 {
        margin-top: 0;
        margin-bottom: 12px;
        color: #0f3e89;
    }

    .contact-box p {
        margin: 0;
        color: #555;
        line-height: 1.8;
    }

</style>

<div class="container contact-container">

    <div class="contact-card">

        <!-- HEADER -->

        <div class="contact-header">

            <h2>Contact Us</h2>

            <p>
                Get in touch with BankCC support team for any
                banking assistance or account related help.
            </p>

        </div>

        <!-- BODY -->

        <div class="contact-body">

            <div class="contact-grid">

                <!-- EMAIL -->

                <div class="contact-box">

                    <h3>Email Support</h3>

                    <p>
                        support@bankcc.local
                    </p>

                </div>

                <!-- PHONE -->

                <div class="contact-box">

                    <h3>Phone Number</h3>

                    <p>
                        +91-0000-000000
                    </p>

                </div>

                <!-- ADDRESS -->

                <div class="contact-box">

                    <h3>Office Address</h3>

                    <p>
                        BankCC Main Office,<br />
                        Secure Street,<br />
                        India
                    </p>

                </div>

            </div>

        </div>

    </div>

</div>

</asp:Content>