<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="ProjectPage1.aspx.cs" Inherits="ProjectPage1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Hello</h1>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RecordID" DataSourceID="ProjectPage1Grid">
        <Columns>
            <asp:BoundField DataField="RecordID" HeaderText="RecordID" InsertVisible="False" ReadOnly="True" SortExpression="RecordID" />
            <asp:BoundField DataField="TimeStamp" HeaderText="TimeStamp" SortExpression="TimeStamp" />
            <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
            <asp:BoundField DataField="Temperature" HeaderText="Temperature" SortExpression="Temperature" />
            <asp:BoundField DataField="Humidity" HeaderText="Humidity" SortExpression="Humidity" />
            <asp:BoundField DataField="Media_Filepath" HeaderText="Media_Filepath" SortExpression="Media_Filepath" />
            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
            <asp:BoundField DataField="Science_Name" HeaderText="Science_Name" SortExpression="Science_Name" />
            <asp:BoundField DataField="Common_Name" HeaderText="Common_Name" SortExpression="Common_Name" />
            <asp:BoundField DataField="Validate_Status" HeaderText="Validate_Status" SortExpression="Validate_Status" />
            <asp:BoundField DataField="DeviceID" HeaderText="DeviceID" SortExpression="DeviceID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ProjectPage1Grid" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT Record.RecordID, Record.TimeStamp, Record.Weight, Record.Temperature, Record.Humidity, Record.Media_Filepath, Record.Length, Record.Science_Name, Record.Common_Name, Record.Validate_Status, Record.DeviceID FROM Record INNER JOIN Device ON Record.DeviceID = Device.DeviceID WHERE (Device.ProjectId = @projectId)">
        <SelectParameters>
            <asp:SessionParameter Name="projectId" SessionField="projectId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

