<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword"   %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                           <%-- <LayoutTemplate>--%>
                                                    <fieldset>
                                                        <p align="center" class="text-uppercase">Password Reset: </p>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtUserName" runat="server" class="form-control input-lg" placeholder="Username"></asp:TextBox>
                                                        </div>
<%--                                                        <div class="form-group">
                                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" class="form-control input-lg" placeholder="Password"></asp:TextBox>
                                                        </div>--%>
                                                        <div class="form-group" align="center">
                                                            <asp:Button ID="resetPassBtn" runat="server" CommandName="Reset" Text="Reset Password"  class="btn btn-warning" OnClick="resetPassBtn_Click" />
                                                        </div>
                                                        <div class="form-group" align="center">
                                                            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                                                        </div>
<%--                                                        <div class="form-group" align="center">
                                                            <p align="center">
                                                                Not a Device Owner or Registered User?
                                                                <br />
                                                                Create an account after activating a Device
                                                            </p>
                                                        </div>--%>
                                                    </fieldset>
                                               <%-- </LayoutTemplate>--%>
                                          
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

