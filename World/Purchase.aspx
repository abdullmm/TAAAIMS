<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Purchase.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
.margin-top {
    margin-top: 10px;
}
.block1 {
  height: 50em;
  border: 15px solid #292b2c;
}
.block2 { 
  height: 150px;
  background-color: white;
  border: 7px solid #292b2c;
}
/*#6c757d*/
.grey1 {
 background-color: #6c757d;
}

body {
  background-color: #292b2c;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="bg-dark">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 bg-white block1">
                <div class="form-row" >
                    <div class="col-6 "> 
                        <br />
                        <asp:label runat="server" text="Label"></asp:label>
                        <asp:Label ID="lblPurchase" runat="server" Text="PURCHASE A DEVICE "></asp:Label>
                        <br />
                        <br />
                        <img src="/images/box.png" alt="unit" runat="server" class="h-50 d-inline-block w-75 p-3" />
                        <div class="form-group">
                        <asp:Label ID="lblSpecs" runat="server" Text="Device Specs: "></asp:Label>
                        <br />
                        <br />
                        <p>Product Description: <br/>
                        This device is the perfect contraption to capture the animals you are
                        studying, without harming them. Not only can this device measure the
                        basics, but it can send it up to the cloud into our database for easy sharing
                        </p>
                        </div>                                              
                    </div>
                    <div class="col-6 ">
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="px-2">
                            <div id="form" class="justify-content-center">
                                <div class="form-group">
                                    <label class="sr-only">Name</label>
                                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity: "></asp:Label>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-2">
                                        <label class="sr-only">Name</label>
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control custom-dropdown" >
                                        <asp:ListItem>1</asp:ListItem>
                                        </asp:DropDownList>  
                                    </div>                                                       
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="addToCart" runat="server" Text="Add to Cart" CssClass="btn btn-warning"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 bg-white block1">
                <br />
                <p align="center">MY CART</p>
                <div class="row">
                    <div class="col-md-10 mx-auto">
                        <div class="form-group row">
                            <div class="col-sm-6">
                                <asp:Label ID="lblUnitTotal" runat="server" Text="Device Total"></asp:Label>                          
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="TextBox1" class="form-control" runat="server" placeholder="Total"></asp:TextBox> 
                            </div>
                        </div>
                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <asp:Label ID="lblTaxt" runat="server" Text="Tax"></asp:Label>                     
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="txtTax" class="form-control" runat="server" placeholder="Tax"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <asp:Label ID="lblTotal" runat="server" Text="Order Total"></asp:Label> 
                                </div>
                                <div class="col-sm-6">
                                     <asp:TextBox ID="txtTotal" class="form-control" runat="server" placeholder="Total"></asp:TextBox> 
                                </div>
                            </div> 
                        </div>
                    </div>    
                    <br />
                    <br />
                <div class="form-group" align="center">
                    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn btn-warning"/>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

