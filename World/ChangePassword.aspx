<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator"></asp:CompareValidator>
    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
    <asp:Button ID="btnAccount" runat="server" Text="Account Settings" OnClick="btnAccount_Click" />
    <asp:Label ID="lblValid" runat="server" Text=""></asp:Label>
</asp:Content>

