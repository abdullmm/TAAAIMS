<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="MyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row d-flex justify-content-center bg-dark">
  <div class="col-md-6">
    <div id="cover" class="min-vh-100 bg-dark">
        <div id="cover-caption">
            <div class="container bg-white " id="accountForm">
            <br />
            <%--<div class="col-xl-5 col-lg-6 col-md-8 col-sm-10 mx-auto text-center form p-4 bg-white">--%>
                <div class="form-row" >                    
                    <div class="col-4 ">
                        <h4>My Account Details</h4>
                        <p class="text-orange">NAME</p>
                        <%--<img src="/images/personavatar.png" alt="profilepic" runat="server" class="h-50 d-inline-block w-75 p-3" ID="avatar" style="width:500px;height:600px;border-radius: 50%;" />--%>
                        <asp:Image ID="Image1" runat="server" class="h-50 d-inline-block w-75 p-3" style="width:20em; height:30em; border-radius: 50%;" ViewStateMode="Enabled" ImageAlign="NotSet" />
                        <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false">
                            <Columns>
                                <asp:ImageField DataImageUrlField="Value" ControlStyle-Height="100" ControlStyle-Width="100" />
                            </Columns>
                        </asp:GridView>--%>
                        <asp:FileUpload ID="FileUpload1" runat="server"/>
                        <asp:Button ID="btnUpload" runat="server" Text="Upload Profile Picture" OnClick="UploadFile" class="btn btn-warning"/>
                        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                        <textarea id="w3mission" rows="4" cols="15">
                        </textarea>
                    </div>
                    <div class="col-4">
                        <div id="form" class="justify-content-center">
                            <br />
                            <div class="form-group">
                                <label class="sr-only">Name</label>
                                <asp:TextBox ID="txtName" runat="server" class="form-control input-sm" placeholder="Full Name"></asp:TextBox>
                            </div>
                            <%--<div class="form-group">
                                <label class="sr-only">Name</label>
                                <asp:TextBox ID="LastName" runat="server" class="form-control input-sm" placeholder="Last Name"></asp:TextBox>                             
                            </div>--%>
                            <div class="form-group">
                                <label class="sr-only">Name</label>
                                <asp:TextBox ID="txtAff" runat="server" class="form-control input-sm" placeholder="Affiliation"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="sr-only">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control input-sm" placeholder="Email"></asp:TextBox>  
                            </div>  
                        </div>
                    </div>
                    <div class="col-4">
                        <p>Data Settings & Permissions</p>
                        <p>
                            Control which of your data is
                            public, which is private, and
                            what you can share with
                            others on your teams and
                            within projects
                        </p>
                        <div class="form-group" align="center">
                            <asp:Button ID="btnSet" runat="server" Text="Set Permissions" CssClass="btn btn-warning form-control" Width="12em"/>
                        </div>
                        <br />

                        <div class="form-group" align="center">
                            <asp:Button ID="btnChange" runat="server" Text="Change Password" CssClass="btn btn-warning form-control" Width="12em" OnClick="btnChange_Click"/>
                        </div>
                        <div class="form-group" align="center">   
                            <asp:Button ID="btnUpdate" runat="server" Text="Save & Update Changes" CssClass="btn btn-warning form-control" Width="12em" OnClick="btnUpdate_Click"/>
                        </div>
                    </div>
                  </div>
               <%-- </div>--%>
             </div>
           </div>
        </div>
    </div>
</div>
</asp:Content>

