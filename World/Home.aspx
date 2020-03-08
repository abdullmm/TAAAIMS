<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="User_Login_CS.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>--%>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Adventure Works SalesPerson Dashboard</title>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDksEnZmFtaehIf5sQFG5GWe0wsefuR2gU"></script>
    <script type="text/javascript">
        google.load('visualization', '1', { packages: ['corechart', 'table'] });
    </script>
    <script type="text/javascript">

	// this gets it all started
	google.setOnLoadCallback(drawWebPage);


        // query connection string to Google spreadsheet
	var queryConnectionString =  "https://docs.google.com/spreadsheets/d/10Xwod9RGBsPGIZjkWYn4EIjfMFB3U8iD6fH5jARg3-k/edit?usp=sharing";

	// data tables (contain results of queries)

	var dataTable3;

	// map
	var map;

	function drawWebPage() {

		sendQuery();

	}

	function sendQuery(){
		// query for salespeople
		var query = new google.visualization.Query(queryConnectionString);
		query.setQuery("SELECT A, B, C limit 14");
		query.send(onQuery1Response);


	}

	function onQuery1Response(response) {
 // error-handling code
		if (response.isError()) {
		  alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
		  return;
		}

		
		          // create a map
          map = new google.maps.Map(document.getElementById('container3'), {
              mapTypeId: google.maps.MapTypeId.ROADMAP,
              zoom: 6,
                            styles: [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#263c3f"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6b9a76"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9ca5b3"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#1f2835"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f3d19c"
      }
    ]
  },
  {
    "featureType": "road.local",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2f3948"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#515c6d"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  }
]
          });
          // create a LatLng object (latitude and longitude values)
          var latlng = new google.maps.LatLng(38.5, -78.9);
          // center the map at the lat/lng location (centered at Harrisonburg)
          map.setCenter(latlng);



	
	}

 
	function onGeocodeResponse(response, status) {
		// the Geocode service has sent its response. We can now use it for the map
		if (status == google.maps.GeocoderStatus.OK) {
		// center the map at the location returned from the geocoding service
		map.setCenter(response[0].geometry.location);
		
		// set up the store names for the city to display in marker tool tip
		var storesInCity = "\n";
		for (var i = 0; i < dataTable3.getNumberOfRows(); i++) {
		if (response[0].address_components[0].long_name == dataTable3.getValue(i,1))
		storesInCity += "\n" + dataTable3.getValue(i,0);
		}

		var marker = new google.maps.Marker({
		map: map,
		position: response[0].geometry.location,
		title: response[0].address_components[0].long_name + storesInCity				});
		}
		//else alert("error in geocoding: " + status);	// typically this will mean exceed query limit
		}
    </script>
<%--</head>
    </html>--%>


    <script type="text/javascript" src="https://public.tableau.com/javascripts/api/tableau-2.min.js"></script>
    <script type="text/javascript">
        function initViz() {
            var containerDiv = document.getElementById("vizContainer"),
                url = "https://public.tableau.com/views/ProjectDemo_15830857369020/Dashboard1?:display_count=y&:toolbar=n&:origin=viz_share_link",
                options = {
                    hideTabs: true,
                    onFirstInteractive: function () {
                        console.log("Run this code when the viz has finished loading.");
                    }
                };
            
            // Create a viz object and embed it in the container div.
            var viz = new tableau.Viz(containerDiv, url, options); 
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-fluid" <%--id="map"--%>>
        
    <%--<body onload="initViz();">
        <div id="vizContainer" class="w-100 p-3" style="width: 60em; height: 30em;">

        </div>    
    </body>--%>
    <div id="container3" class="w-100 p-3" style="width: 60em; height: 30em;">
    </div>
	</div>
    

    
    <!--Cards-->
<div class="container-fluid bg-light text-dark">
<div class="card-deck p-5">
  <div class="card card1">
    <div class="card-body body1">
      <h5 class="card-title1">Discover.</h5>
      <p class="card-text text1">See what animals are around you! This database collects data of researchers dedicated to getting to know the world around them.</p>
    </div>
  </div>
  <div class="card card2">
    <div class="card-body body2">
      <h5 class="card-title2">Learn.</h5>
      <p class="card-text text2">Interact with the data from a network of researchers world-wide to understand what is going on in the ecosystem around you</p>
    </div>
  </div> <div class="card card3">
    <div class="card-body body3">
      <h5 class="card-title3">Engage.</h5>
      <p class="card-text text3">Seen a species before? Engage with other users, students, and researchers on our FORUM page to join in the discussion.</p>
    </div>
  </div>
  <div class="card card4">
    <div class="card-body body4">
      <h5 class="card-title4">Explore.</h5>
      <p class="card-text text4">Want to gather your own data? Purchase a device, register it, and start collecting data now on the species near you. Check out our DEVICES page to get started today.</p>
    </div>
  </div>
</div>
</div>
<!-- jQuery and Bootstrap links - do not delete! -->
    
<%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous" runat="server"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous" runat="server"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous" runat="server"></script>--%>
<!-- end of do not delete -->
</asp:Content>
