<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Project.aspx.cs" Inherits="Project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/Shared/mycustom.css" rel="stylesheet" type="text/css" media="screen" />
    <style type="text/css">
    .block2 
    {
    height: 25em;
    background-color: white;
    border: 10px solid #292b2c;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bg-dark">
    <div class="container-fluid">
        <div class="row margin-top">
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-sm-12 block2 " style="background: white;">
                        <h1>Projects</h1>
                        <asp:DropDownList ID="projectList" runat="server"></asp:DropDownList>
                        <asp:Button ID="btnViewProject" runat="server" Text="View" />
                        <asp:DropDownList ID="myTeamList" runat="server"></asp:DropDownList>
                        <asp:Button ID="btnRemoveTeam" runat="server" Text="Remove" />
                        <asp:DropDownList ID="myDeviceList" runat="server"></asp:DropDownList>
                        <asp:Button ID="btnRemoveDevice" runat="server" Text="Remove" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 block2 " style="background: white;">
                        <h1>My Team</h1>
                        <asp:DropDownList ID="teamList" runat="server"></asp:DropDownList>
                        <asp:Button ID="btnAddTeam" runat="server" Text="Add" />
                    </div>
                </div>
            </div>
            <div class="col-sm-4 block1 " style="background: white;">
                <br />
                <h3 align="center">My Devices</h3>
                <br />
                <asp:DropDownList ID="deviceList" runat="server" DataSourceID="deviceListDataSource" DataTextField="Nickname" DataValueField="DeviceID"></asp:DropDownList>
                <asp:SqlDataSource ID="deviceListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="grid_Bind" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="userId" SessionField="userId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Button ID="btnAddDevice" runat="server" Text="Add" />
                <div class="form-group">
                DEVICE NAME
                Device No.: #258901
                Owner: Dr. Gobetz
                Status: Active
                GPS Location:
                Projects associated: 1
                More info…
                </div>
        
                <div class="form-group">
                DEVICE NAME
                Device No.: #258901
                Owner: JMU Bio Staff
                Status: Active
                GPS Location:
                Projects associated: 1
                More info…
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

