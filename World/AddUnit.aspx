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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                <Columns>  
                    <asp:BoundField HeaderText="DeviceID" DataField="DeviceID" />  
                    <asp:BoundField HeaderText="Nickname" DataField="Nickname]" />  
                    <asp:BoundField HeaderText="Bluetooth" DataField="Bluetooth" />  
                    <asp:BoundField HeaderText="Wifi" DataField="Wifi" />
                    <asp:BoundField HeaderText="Mode" DataField="MediaMode" />  
                    <asp:BoundField HeaderText="Interval Delay" DataField="IntervalDelay" />  
                    <asp:BoundField HeaderText="Video Duration" DataField="VideoDuration" />
                    <asp:BoundField HeaderText="Number Images" DataField="NumberImages" />
                    <asp:BoundField HeaderText="Weight Unit" DataField="WgtUnit" /> 
                    <asp:BoundField HeaderText="Battery Life" DataField="BattLife" /> 
                    <asp:BoundField HeaderText="Latitude" DataField="Latitude" />
                    <asp:BoundField HeaderText="Longitude" DataField="Longitude" /> 
                </Columns> 
            </asp:GridView>
        </div>
    </div>
</asp:Content>

