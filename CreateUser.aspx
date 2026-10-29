<%@ Page Title="Create User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Admin_CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .create-user-box {
        max-width: 850px;
        margin: 20px auto;
        background: #fff;
        border-radius: 14px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        overflow: hidden;
    }

    .create-header {
        background: linear-gradient(135deg, #0f3e89, #1d5cb8);
        color: white;
        padding: 25px 30px;
    }

    .create-header h2 {
        margin: 0 0 8px;
        font-size: 30px;
    }

    .create-header p {
        margin: 0;
        color: #e4ecff;
        font-size: 15px;
    }

    .create-body {
        padding: 30px;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 18px;
    }

    .input-group label {
        display: block;
        margin-bottom: 7px;
        font-weight: 600;
        color: #333;
    }

    .input {
        width: 100%;
        height: 45px;
        border: 1px solid #ccd6f0;
        border-radius: 8px;
        padding: 0 12px;
        font-size: 14px;
    }

    .input:focus {
        outline: none;
        border-color: #d4a017;
        box-shadow: 0 0 0 3px rgba(212,160,23,0.15);
    }

    .validator {
        color: #d11a2a;
        font-size: 13px;
    }

    .full-width {
        grid-column: 1 / -1;
    }

    .create-btn {
        background: #d4a017;
        color: white;
        border: none;
        padding: 12px 24px;
        border-radius: 8px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
    }

    .create-btn:hover {
        background: #b88910;
    }

    @media (max-width: 768px) {

        .form-grid {
            grid-template-columns: 1fr;
        }

        .create-body {
            padding: 22px;
        }

    }

</style>

<div class="container">

    <div class="create-user-box">

        <!-- HEADER -->

        <div class="create-header">

            <h2>Create User</h2>

            <p>
                Add new users and create online banking accounts.
            </p>

        </div>

        <!-- BODY -->

        <div class="create-body">

            <asp:Label ID="lblMessage" runat="server" />

            <div class="form-grid">

                <!-- NAME -->

                <div class="input-group">

                    <label>Full Name</label>

                    <asp:TextBox 
                        ID="txtName"
                        runat="server"
                        CssClass="input"
                        placeholder="Enter Full Name">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        runat="server"
                        ControlToValidate="txtName"
                        ErrorMessage="Name is required."
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>

                <!-- USERNAME -->

                <div class="input-group">

                    <label>Username</label>

                    <asp:TextBox
                        ID="txtUsername"
                        runat="server"
                        CssClass="input"
                        placeholder="Enter Username">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        runat="server"
                        ControlToValidate="txtUsername"
                        ErrorMessage="Username is required."
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>

                <!-- PASSWORD -->

                <div class="input-group">

                    <label>Password</label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="input"
                        placeholder="Enter Password">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>

                <!-- BALANCE -->

                <div class="input-group">

                    <label>Opening Balance</label>

                    <asp:TextBox
                        ID="txtBalance"
                        runat="server"
                        CssClass="input"
                        Text="0">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        runat="server"
                        ControlToValidate="txtBalance"
                        ErrorMessage="Balance is required."
                        CssClass="validator">
                    </asp:RequiredFieldValidator>

                </div>

                <!-- BUTTON -->

                <div class="full-width">

                    <asp:Button
                        ID="btnCreate"
                        runat="server"
                        Text="Create User"
                        CssClass="create-btn"
                        OnClick="btnCreate_Click" />

                </div>

            </div>

        </div>

    </div>

</div>

</asp:Content>