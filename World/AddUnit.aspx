<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="AddUnit.aspx.cs" Inherits="AddUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="form" class="justify-content-center">
        <div class="form-group">
            <asp:Label ID="Description" runat="server" Text="Enter your device number and your activation key to add a device"></asp:Label>
        </div>
        <div class="form-group">                                
            <label class="sr-only">Name</label>
            <asp:TextBox ID="deviceNumber" runat="server" class="form-control" placeholder="Device Number"></asp:TextBox>                                                                                      
        </div>
        <div class="form-group">
            <label class="sr-only">Email</label>
            <asp:TextBox ID="accessCode" runat="server" placeholder="Activation Key" class="form-control"></asp:TextBox>                               
        </div>
        <div class="form-group">
            <asp:Button ID="btnAdd" runat="server" Text="Activate Device" OnClick="add_Click" class="btn btn-warning form-control"/>
            <asp:Label ID="lblValid" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>
        <div class="form-group">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DeviceID" DataSourceID="SqlDataSource1">
                <Columns>  
                    <asp:BoundField HeaderText="DeviceID" DataField="DeviceID" InsertVisible="False" ReadOnly="True" SortExpression="DeviceID" />  
                    <asp:BoundField HeaderText="Nickname" DataField="Nickname" SortExpression="Nickname" />  
                    <asp:BoundField HeaderText="Bluetooth" DataField="Bluetooth" SortExpression="Bluetooth" />  
                    <asp:BoundField HeaderText="Wifi" DataField="Wifi" SortExpression="Wifi" />
                    <asp:BoundField HeaderText="MediaMode" DataField="MediaMode" SortExpression="MediaMode" />  
                    <asp:BoundField HeaderText="IntervalDelay" DataField="IntervalDelay" SortExpression="IntervalDelay" />  
                    <asp:BoundField HeaderText="VideoDuration" DataField="VideoDuration" SortExpression="VideoDuration" />
                    <asp:BoundField HeaderText="NumberImages" DataField="NumberImages" SortExpression="NumberImages" />
                    <asp:BoundField HeaderText="WgtUnit" DataField="WgtUnit" SortExpression="WgtUnit" /> 
                    <asp:BoundField HeaderText="BattLife" DataField="BattLife" SortExpression="BattLife" /> 
                    <asp:BoundField HeaderText="Latitude" DataField="Latitude" SortExpression="Latitude" />
                    <asp:BoundField HeaderText="Longitude" DataField="Longitude" SortExpression="Longitude" /> 
                </Columns> 
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginDBConnectionString %>" SelectCommand="grid_Bind" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="userId" SessionField="userId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

