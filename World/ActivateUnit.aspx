<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="ActivateUnit.aspx.cs" Inherits="ActivateUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            <div <%--class="row text-white"--%>>
                <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 mx-auto text-center form p-4 bg-white">
                    <h2 class="text-center" id="title"><img src="/images/logocrop.png" alt="logocopy" runat="server" id="logo" class="teamLogo"/></h2>
                    <p <%--class="display-4 py-2"--%>>Activate Your Device & Create an Account</p>
                    

                    
                    <div class="px-2 ">
                        <div id="form" class="justify-content-center">
                            <div class="form-group">
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
                                <asp:Button ID="Activate" runat="server" Text="Activate Device" OnClick="Activate_Click" class="btn btn-warning form-control"/>
                                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
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
</asp:Content>

