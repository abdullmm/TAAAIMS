<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="CreateProject.aspx.cs" Inherits="CreateProject"%>

<script runat="server">

</script>

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
                            <p <%--class="display-4 py-2"--%>>Your box will be associated with a project.</p>
                            <div class="px-2 ">
                                <div id="form" class="justify-content-center">
                                    <div class="form-group">
                                        <asp:Label ID="Description" runat="server" Text="Please name your first Project!"></asp:Label>
                                    </div>
                                    <div class="form-group">                                
                                       
                                        <asp:TextBox ID="txtProjectName" runat="server" class="form-control" placeholder="Project Name"></asp:TextBox>                                                                                      
                                    </div>

                                    <div class="form-group">
                                        <asp:Button ID="Create" runat="server" Text="Create Project"  class="btn btn-warning form-control" OnClick="Create_Click"/>
                                    </div>
                                    <br />

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

