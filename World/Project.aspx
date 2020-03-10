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
	<h1>block 3</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12 block2 " style="background: white;">
          <h1>block 2</h1>
        </div>
      </div>
    </div>
    <div class="col-sm-4 block1 " style="background: white;">
      <br />
      <h3 align="center">My Devices</h3>
      <br />
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

