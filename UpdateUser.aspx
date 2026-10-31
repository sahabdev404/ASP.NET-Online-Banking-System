<%@ Page Title="Update User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="UpdateUser.aspx.cs" Inherits="Admin_UpdateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container form-card">
        <h2>Update User</h2>
        <asp:Label ID="lblMessage" runat="server" />
        <div class="form-grid">
            <div><label>Account No</label><asp:TextBox ID="txtAccountNo" runat="server" CssClass="input" ReadOnly="true" /></div>
            <div><label>Name</label><asp:TextBox ID="txtName" runat="server" CssClass="input" /><asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Name required." CssClass="validator" /></div>
            <div><label>Username</label><asp:TextBox ID="txtUsername" runat="server" CssClass="input" /><asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername" ErrorMessage="Username required." CssClass="validator" /></div>
            <div><label>Password</label><asp:TextBox ID="txtPassword" runat="server" CssClass="input" /><asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password required." CssClass="validator" /></div>
            <div><label>Balance</label><asp:TextBox ID="txtBalance" runat="server" CssClass="input" /><asp:RequiredFieldValidator runat="server" ControlToValidate="txtBalance" ErrorMessage="Balance required." CssClass="validator" /></div>
            <div class="full-width"><asp:Button ID="btnUpdate" runat="server" Text="Update User" CssClass="btn btn-primary" OnClick="btnUpdate_Click" /></div>
        </div>
    </div>
</asp:Content>
