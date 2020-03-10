<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="OwnerSignUp.aspx.cs" Inherits="OwnerSignUp" %>

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
                        <h2 class="text-center" id="title"><img src="/images/logocrop.png" alt="logocopy" runat="server" id="logo" class="teamLogo"/></h2>
                            <div class="px-2 ">
                                <div id="form" class="justify-content-center">
                                    <div align="center">
                                        <fieldset>              
                                    <p align="center" class="text-uppercase text-orange"><b>Account Sign Up:</b></p>  
                                    <div class="form-group">
                                        <div class="form-row">
                                            <div class="col-sm-1">
                                            </div>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>                                                 
                                            </div> 
                                            <div class="col-sm-1">
                                                <asp:RequiredFieldValidator ID="require1" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <div class="form-row">
                                            <div class="col-sm-1">
                                            </div>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="Username"></asp:TextBox>                                                                                                  
                                            </div> 
                                            <div class="col-sm-1">
                                                <asp:RequiredFieldValidator ID="userNameRequired" runat="server" ControlToValidate="txtUserName" ErrorMessage="*" ToolTip="User Name is required."></asp:RequiredFieldValidator> 
                                            </div>
                                       </div>
                                     </div>
                                     <div class="form-group">
                                        <div class="form-row">
                                            <div class="col-sm-1">
                                            </div>
                                            <div class="col-sm-10">
                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>                                                  
                                            </div> 
                                            <div class="col-sm-1">
                                                <asp:RequiredFieldValidator ID="passwordRequired" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ToolTip="Password is required." ></asp:RequiredFieldValidator>                              
                                            </div>
                                        </div>
                                     </div>
                                     <div class="form-group">
                                        <div class="form-row">
                                            <div class="col-sm-1">
                                            </div>
                                            <div class="col-sm-10">
                                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" class="form-control" placeholder=" Confirm Password"></asp:TextBox>                                                                                                   
                                            </div> 
                                            <div class="col-sm-1">
                                                <asp:RequiredFieldValidator ID="require3" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="*" ToolTip="Password is required." ></asp:RequiredFieldValidator>   
                                            </div>
                                        </div>
                                      </div>                                         
                                    <div class="form-group">    
                                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtPassword" ID="MyPassordMinLengthValidator" ValidationExpression="^[\s\S]{8,}$" runat="server" ErrorMessage="Password must be at least 8 characters long."></asp:RegularExpressionValidator>
                                        <!-- Add validator for minimum required characters -->
                                        <br />
                                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtPassword" ID="MyPassordRequiredCharacterValidator" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$" runat="server" ErrorMessage="Must contain at least one uppercase letter, one lowercase letter, and one number."></asp:RegularExpressionValidator>
                                        <asp:Label ID="lblValid" runat="server" Text="Your Account has been created successfully!" Visible="false"></asp:Label>
                                        </div>  
                                    <div class="form-group" align="center">
                                        <asp:CompareValidator ID="passwordCompare" runat="server" ErrorMessage="Passwords must match" ControlToValidate="txtPassword" ControlToCompare="txtConfirmPassword" Operator="Equal"></asp:CompareValidator>
                                        <%--<asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>--%>     
                                    </div>
                                    <div class="form-group" align="center">
                                        <asp:Button ID="btnCreate" runat="server" CommandName="create" Text="Create Account" class="btn btn-warning" OnClick="btnCreate_Click" />
                                        <br />
                                        <asp:Button ID="btnLogin" runat="server" CommandName="login" Text="Login Page" class="btn btn-warning" OnClick="btnLogin_Click" Visible="false" CausesValidation="False"/>
                                    </div>                                           
                                    </fieldset>     
                                    </div>        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>     
</asp:Content>

