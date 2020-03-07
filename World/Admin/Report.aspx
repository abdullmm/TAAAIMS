<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Admin_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Reports</h1>
    <table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <asp:DropDownList ID="ddlLength" runat="server">
                <asp:ListItem Text="5" Value="5" />
                <asp:ListItem Text="8" Value="8" />
                <asp:ListItem Text="10" Value="10" />
            </asp:DropDownList>
        </td>
        <td>
            <asp:RadioButtonList ID="rbType" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Text="Alphanumeric" Value="1" Selected="True" />
                <asp:ListItem Text="Numeric" Value="2" />
            </asp:RadioButtonList>
        </td>
        <td>
            <asp:Button ID="btnGenerate" Text="Generate OTP" runat="server" OnClick="GenerateOTP" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="3">
            OTP:
            <asp:Label ID="lblOTP" runat="server" />
        </td>
    </tr>
</table>
</asp:Content>

