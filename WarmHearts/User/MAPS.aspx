<%@ Page Title="" Language="C#" MasterPageFile="~/User/ORPH.Master" AutoEventWireup="true" CodeBehind="MAPS.aspx.cs" Inherits="WarmHearts.User.MAPS" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBaOMVKmQnJ-EYaPBqWAPF4OTRNZ4Gewd0" defer></script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


   <script type="text/javascript">
       var markers = [
           <asp:Repeater ID="rptMarkers" runat="server">
               <ItemTemplate>
                   {
            "title": '<%# Eval("OP_ADD") %>',
            "lat": '<%# Eval("OP_LAT") %>',
            "lng": '<%# Eval("OP_LON") %>',
            "description": '<%# Eval("OP_NAME") %>'
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
            center: new google.maps.LatLng(10.311780, 123.916412),
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
