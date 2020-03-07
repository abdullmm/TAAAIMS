<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="icon" href="/images/icon.png" type="image/x-icon" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <div class="container-fluid">
    <div class="container">
      <h2 class="text-center" id="title"><img src="/images/logocrop.png" alt="logocopy" runat="server" /></h2>
        <hr />
        <div class="row">
            <div class="col-md-5">
            
          
           <%-- <fieldset>              
              <p class="text-uppercase pull-center"> Register:</p> 
              <div class="form-group">
                <input type="text" name="username" id="username" class="form-control input-lg" placeholder="Username" runat="server"/>
              </div>

              <div class="form-group">
                <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                <%--<input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" runat="server"/>--%>
            <%--  </div>
              <div class="form-group">
                <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" runat="server"/>
              </div>
              <div>
                    <input type="submit" class="btn btn-md btn-primary" value="Register" runat="server"/>
              </div>
            </fieldset>--%>
          
        </div>
    <div class="col-md-2">
          <!-------null------>
    </div>
    <div class="col-md-5">
    <asp:Login ID="Login1" runat="server" OnAuthenticate="ValidateUser">
        
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
                 
            </fieldset>
      <%--  </form> --%>
        
                
                                    
                                                         
                         
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
        </LayoutTemplate>
            
    </asp:Login>
        </div>
            </div>
        </div>
    </div>
    
</asp:Content>

