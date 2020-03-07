<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="icon" href="/images/icon.png" type="image/x-icon" />
    <link href="/Shared/mycustom.css" rel="stylesheet" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="text-center bg-dark">
    <div class="row d-flex justify-content-center">
  <!--Grid column-->
  <div class="col-md-6">
   <div id="cover" class="min-vh-100 bg-dark">
    <%--<div id="cover-caption">--%>
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 mx-auto text-center form p-4 bg-white">
                    <h2 class="text-center" id="title"><img src="/images/logocrop.png" alt="logocopy" runat="server" id="logo" class="teamLogo"/></h2>
                    <%--class="display-4 py-2"--%>
                      <%-- <p>  Account Login</p>--%>

                    <div class="px-2 ">
                        <div id="form" class="justify-content-center">
                              <%--<div class="form-group">
                            <asp:Label ID="Description" runat="server" Text="Enter your device number and your activation key to active. Once you active your device. Create an Account"></asp:Label>
                            </div>
                            <div class="form-group">                                
                               <label class="sr-only">Name</label>
                                <asp:TextBox ID="DeviceNumber" runat="server" class="form-control" placeholder="Device Number"></asp:TextBox>                                                                                      
                            </div>
                            <div class="form-group">
                                <label class="sr-only">Email</label>
                                <asp:TextBox ID="AccessCode" runat="server" placeholder="Activation Key" class="form-control"></asp:TextBox>
                                
                            </div>
                                <div class="form-group">
                                
                                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
                                </div>--%>
                            
                                <div align="center">
 
   
       <asp:Login ID="Login1" runat="server" OnAuthenticate="ValidateUser" >
        
        <LayoutTemplate >
            
            <%--<form role="form">--%>
            <fieldset>              
              <p align="center" class="text-uppercase"> Account Login: </p> 
                
              <div class="form-group">
                 <asp:TextBox ID="UserName" runat="server" class="form-control input-lg" placeholder="Username"></asp:TextBox>
                 <%--<asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>--%>
              </div>

              <div class="form-group">
                <asp:TextBox ID="Password" runat="server" TextMode="Password" class="form-control input-lg" placeholder="Password"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>--%>

              </div>
              <div class="form-group" align="center">
                    <%--<asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>--%>
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" class="btn btn-warning" />
              </div>
              <div class="form-group" align="center">
                  <p align="center"> Not a Device Owner or Registered User? <br />
                      Create an account after activating a Device
                  </p>
                   <asp:Button ID="btnLink" runat="server"  Text="Activate A Device" class="btn btn-warning" OnClick="btnLink_Click" />
              </div>
                 
            </fieldset>
      <%--  </form> --%>
        </LayoutTemplate>
            
    </asp:Login>

       
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
  <!--Grid column-->
        </div>
<!--Grid row-->
</div> 
    <div class="container-fluid bg-dark">
    <div class="container">
      
        <hr />
        <div class="row bg-white">
            <div class="col-md-5">
            
                    
        </div>
    
    <div class="col-md-5">
    
                
                                    
                                                         
                         
            <%--<table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td class="text-uppercase" align="center" colspan="2">Log In</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" class="form-control input-lg" placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" class="form-control input-lg" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" class="btn btn-md btn-primary" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>--%>
        
        </div>
            </div>
        </div>
    </div>
</asp:Content>

