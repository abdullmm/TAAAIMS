<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="NewPassword.aspx.cs" Inherits="NewPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="text-center bg-dark">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <div id="cover" class="min-vh-100 bg-dark">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 mx-auto text-center form p-4 bg-white">
                                <h2 class="text-center" id="title">
                                    <img src="/images/logocrop.png" alt="logocopy" runat="server" id="logo" class="teamLogo" /></h2>
                                <div class="px-2 ">
                                    <div id="form" class="justify-content-center">
                                        <div align="center">
                                            <fieldset>
                                                <p align="center" class="text-uppercase">Password Reset: </p>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtNewPassword" placeholder="New Password" class="form-control input-lg" TextMode="Password"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewPassword"
                                                        runat="server" ErrorMessage="New Password required"
                                                        Text="*" ControlToValidate="txtNewPassword" ForeColor="Red">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtConfirmNewPassword" placeholder="Confirm Password" class="form-control input-lg"  TextMode="Password" runat="server">
                                                    </asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmNewPassword"
                                                        runat="server" ErrorMessage="Confirm New Password required" Text="*"
                                                        ControlToValidate="txtConfirmNewPassword"
                                                        ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidatorPassword" runat="server"
                                                        ErrorMessage="New Password and Confirm New Password must match"
                                                        ControlToValidate="txtConfirmNewPassword" ForeColor="Red"
                                                        ControlToCompare="txtNewPassword"
                                                        Display="Dynamic" Type="String" Operator="Equal" Text="*">
                                                    </asp:CompareValidator>
                                                </div>
                                                <div class="form-group" align="center">
                                                    <asp:Button ID="resetPassBtn" runat="server" CommandName="Reset" Text="Reset Password" class="btn btn-warning" OnClick="resetPassBtn_Click" />
                                                </div>
                                                <div class="form-group" align="center">
                                                    <asp:Label ID="lblMessage" runat="server">
                                                    </asp:Label>
                                                </div>
                                                <div class="form-group" align="center">
                                                    <asp:ValidationSummary ID="ValidationSummary1"
                                                        ForeColor="Red" runat="server" />
                                                </div>
                                                
                                                <div class="form-group" align="center">
                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtNewPassword" ID="MyPassordMinLengthValidator" ValidationExpression="^[\s\S]{8,}$" runat="server" ErrorMessage="Password must be at least 8 characters long."></asp:RegularExpressionValidator>
                                                </div>
                                                <div class="form-group" align="center">
                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtNewPassword" ID="MyPassordRequiredCharacterValidator" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$" runat="server" ErrorMessage="Must contain at least one uppercase letter, one lowercase letter, and one number."></asp:RegularExpressionValidator>
                                                </div>
                                                
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--    </div>
</div>--%>
            </div>
        </div>
    </div>
</asp:Content>