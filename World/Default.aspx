<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" CodeFile="Default.aspx.cs" Inherits="Default"  %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDksEnZmFtaehIf5sQFG5GWe0wsefuR2gU"></script>
    <script type="text/javascript">
        var markers = [
            <asp:Repeater ID="rptMarkers" runat="server">
        <ItemTemplate>
            {
            "title": '<%# Eval("NickName") %>',
            "lat": '<%# Eval("Latitude") %>',
            "lng": '<%# Eval("Longitude") %>'
           
            }
        </ItemTemplate>
        <SeparatorTemplate>
            ,
        </SeparatorTemplate>
    </asp:Repeater>
        ];
    </script>
    <script type="text/javascript">
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title
                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.description);
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }
    </script>
    <div id="dvMap" style="width: 500px; height: 500px">
    </div>
</asp:Content>

