<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">    
    <div class="form-group">
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Old Password"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" placeholder="New Password"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox>
    </div>
    <div class="form-group">
        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" class="btn btn-warning form-control"/>
    </div>
    <div class="form-group">
        <asp:Button ID="btnAccount" runat="server" Text="Account Settings" OnClick="btnAccount_Click" class="btn btn-warning form-control"/>
    </div>
    <div class="form-group">
        <asp:CompareValidator ID="validCompare" runat="server" ErrorMessage="(Passwords must match!)" Operator="Equal" ControlToValidate="txtNewPassword" ControlToCompare="txtConfirmPassword" Visible="True"></asp:CompareValidator>
        <asp:Label ID="lblValid" runat="server" Text=""></asp:Label>
    </div>
</div>
</asp:Content>

