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
                        <asp:DropDownList ID="projectList" runat="server" DataSourceID="projectlistDataSource" DataTextField="ProjectName" DataValueField="ProjectId" OnSelectedIndexChanged="projectList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource ID="projectlistDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT Project.ProjectId, Project.OwnerId, Project.ProjectName, Project.LastUpdated, Project.LastUpdatedBy, TeamOwner.UserId, TeamOwner.LastUpdated AS Expr1, TeamOwner.LastUpdatedBy AS Expr2 FROM Project INNER JOIN TeamOwner ON Project.OwnerId = TeamOwner.UserId WHERE (TeamOwner.UserId = @UserId)">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserId" SessionField="userId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <asp:Button ID="btnViewProject" runat="server" Text="View" OnClick="btnViewProject_Click" />
                        <asp:DropDownList ID="myTeamList" runat="server" DataSourceID="myTeamSource" AutoPostBack="True" DataTextField="Username" DataValueField="UserId"></asp:DropDownList>
                        <asp:SqlDataSource ID="myTeamSource" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT TeamMember.UserId, TeamMember.OwnerId, TeamMember.LastUpdated, TeamMember.LastUpdatedBy, TeamOwner.UserId AS Expr1, TeamOwner.LastUpdated AS Expr2, TeamOwner.LastUpdatedBy AS Expr3, Users.UserId AS Expr4, Users.Username, Users.Password, Users.Salt, Users.Name, Users.Email, Users.Organization, Users.CreatedDate, Users.LastLoginDate, Users.LastUpdated AS Expr5, Users.LastUpdatedBy AS Expr6, Users.Image, Users.Role FROM TeamMember INNER JOIN TeamOwner ON TeamMember.OwnerId = TeamOwner.UserId FULL OUTER JOIN Users ON TeamMember.UserId = Users.UserId WHERE (TeamOwner.UserId = @UserId) AND (TeamMember.ProjectId = @ProjectId)">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserId" SessionField="userId" />
                                <asp:SessionParameter Name="ProjectId" SessionField="projectId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="btnRemoveTeam" runat="server" Text="Remove" OnClick="btnRemoveTeam_Click" />
                        <asp:DropDownList ID="myDeviceList" runat="server" DataSourceID="myDeviceDataSource" DataTextField="Nickname" DataValueField="DeviceID" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource ID="myDeviceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT Device.DeviceID, Device.ActivationCode, Device.Nickname, Device.Bluetooth, Device.Wifi, Device.MediaMode, Device.IntervalDelay, Device.VideoDuration, Device.NumberImages, Device.WgtUnit, Device.BattLife, Device.Latitude, Device.Longitude, Device.OwnerID, Device.ProjectId, TeamOwner.UserId, TeamOwner.LastUpdated, TeamOwner.LastUpdatedBy FROM Device INNER JOIN TeamOwner ON Device.OwnerID = TeamOwner.UserId WHERE (TeamOwner.UserId = @UserId) AND (Device.ProjectId = @projectId)">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserId" SessionField="userId" />
                                <asp:SessionParameter Name="projectId" SessionField="projectId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="btnRemoveDevice" runat="server" Text="Remove" OnClick="btnRemoveDevice_Click" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 block2 " style="background: white;">
                        <h1>My Team</h1>
                        <asp:DropDownList ID="teamList" runat="server" DataSourceID="teamListDataSource" DataTextField="Username" DataValueField="UserId" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource ID="teamListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT TeamMember.UserId, TeamMember.OwnerId, TeamMember.LastUpdated, TeamMember.LastUpdatedBy, TeamMember.ProjectId, TeamOwner.UserId AS Expr1, TeamOwner.LastUpdated AS Expr2, TeamOwner.LastUpdatedBy AS Expr3, Users.UserId AS Expr4, Users.Username, Users.Password, Users.Salt, Users.Name, Users.Email, Users.Organization, Users.CreatedDate, Users.LastLoginDate, Users.LastUpdated AS Expr5, Users.LastUpdatedBy AS Expr6, Users.Image, Users.Role FROM TeamMember INNER JOIN TeamOwner ON TeamMember.OwnerId = TeamOwner.UserId FULL OUTER JOIN Users ON TeamMember.UserId = Users.UserId WHERE (TeamOwner.UserId = @UserId) AND (TeamMember.ProjectId IS NULL)">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserId" SessionField="userId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="btnAddTeam" runat="server" Text="Add" OnClick="btnAddTeam_Click" />
                    </div>
                </div>
            </div>
            <div class="col-sm-4 block1 " style="background: white;">
                <br />
                <h3 align="center">My Devices</h3>
                <br />
                <asp:DropDownList ID="deviceList" runat="server" DataSourceID="deviceListDataSource" DataTextField="Nickname" DataValueField="DeviceID" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="deviceListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT Device.DeviceID, Device.ActivationCode, Device.Nickname, Device.Bluetooth, Device.Wifi, Device.MediaMode, Device.IntervalDelay, Device.VideoDuration, Device.NumberImages, Device.WgtUnit, Device.BattLife, Device.Latitude, Device.Longitude, Device.OwnerID, Device.ProjectId, TeamOwner.UserId, TeamOwner.LastUpdated, TeamOwner.LastUpdatedBy FROM Device INNER JOIN TeamOwner ON Device.OwnerID = TeamOwner.UserId WHERE (TeamOwner.UserId = @UserId) AND (Device.ProjectId IS NULL)">
                    <SelectParameters>
                        <asp:SessionParameter Name="userId" SessionField="userId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Button ID="btnAddDevice" runat="server" Text="Add" OnClick="btnAddDevice_Click" />
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

