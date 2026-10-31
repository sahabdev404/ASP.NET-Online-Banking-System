<%@ Page Title="Search User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="SearchUser.aspx.cs" Inherits="Admin_SearchUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container dashboard-card">
        <h2>Search User</h2>
        <asp:Label ID="lblMessage" runat="server" />
        <div style="display:flex; gap:10px;">
            <asp:TextBox ID="txtKeyword" runat="server" CssClass="input" placeholder="Account number or username" />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
        </div>
        <asp:GridView ID="gvSearchResult" runat="server" AutoGenerateColumns="True" CssClass="grid" />
    </div>
</asp:Content>
