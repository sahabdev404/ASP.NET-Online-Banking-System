<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Admin_ManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container dashboard-card">
        <h2>Manage Users</h2>
        <asp:Label ID="lblMessage" runat="server" />
        <div style="display:flex; gap:10px; margin:10px 0;">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="input" placeholder="Search by account no or username" />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-outline" OnClick="btnReset_Click" />
        </div>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountNo" CssClass="grid"
            OnRowCommand="gvUsers_RowCommand">
            <Columns>
                <asp:BoundField DataField="AccountNo" HeaderText="Account No" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="UserName" HeaderText="Username" />
                <asp:BoundField DataField="Balance" HeaderText="Balance" DataFormatString="{0:0.00}" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditUser" CommandArgument='<%# Eval("AccountNo") %>' Text="Edit" />
                        &nbsp;|&nbsp;
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteUser" CommandArgument='<%# Eval("AccountNo") %>' Text="Delete" OnClientClick="return confirm('Delete this user?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
