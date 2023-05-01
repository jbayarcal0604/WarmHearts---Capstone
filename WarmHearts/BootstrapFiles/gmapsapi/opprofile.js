function initMap() {

    var locations = [
        ['<h4>DSWD <br/></h4> Lapu-Lapu City Hall</br> Quezon National Highway<br/>6015, Lapu-Lapu City, Cebu', 10.316780, 123.965060, 10],
        ['<h4>DSWD <br/></h4> 8X88+J77, Lapu-Lapu<br/> Lalawigan ng Cebu<br/>6015, Lapu-Lapu City, Cebu', 10.3165, 123.9652, 9],
        ['<h4>DSWD REGION OFFICE VII<br/> </h4> Manggahan, Cebu City, 6000 Cebu', 10.375240, 123.876260, 8],
        ['<h4>DSWD FIELD OFFICE VII<br/> </h4> MJ Cuenco Avenue, Corner General Maxilom Ave Ext, Cebu City, 6000 Cebu', 10.308530, 123.907480, 7],
        ['<h4>DSWD<br/> </h4>7VXJ+C66, Gen.Java St<br/>Cebu City, Cebu', 10.325980, 123.912110, 6],
        ['<h4>DSWD<br/> </h4>9W5M+FGH, B.Suico, Mandaue<br/> City, 6014 Cebu ', 10.354990, 123.934330, 5],
        ['<h4>Office of Assistant Regional Director for Administration<br/>  DSWD Central Visayas<br/> </h4>8W55+G33, DSWD Field Office, <br/> MJ Cuenco Avenue,Barangay Carreta, <br/> Cebu City, 6000 Cebu', 10.568244, 123.875562, 4],
        ['<h4>DSWD REGIONAL OFFICE 7<br/> </h4>, General Maxilom Ave. Extension<br/>  Cebu City, Cebu', 10.308040, 123.908410, 3],
        ['<h4>DSWD FIELD OFFICE<br/> </h4>1296 M. J. Cuenco Ave, Cebu City, 6000 Cebu', 10.311780, 123.916410, 2],
        ['<h4>DSWD REGIONAL HAVEN<br/> </h4>13A A. Lopez St, Cebu City<br/>Cebu, 6000 Cebu', 10.300890, 123.884650, 1],
    ];

    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: new google.maps.LatLng(10.311780, 123.916412),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {
        marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            map: map,
            label: '',
            icon: ''
        });

        google.maps.event.addListener(marker, 'click', (function (marker, i) {
            return function () {
                infowindow.setContent(locations[i][0]);
                infowindow.open(map, marker);
            }
        })(marker, i));



    }
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var userLat = position.coords.latitude;
            var userLng = position.coords.longitude;
            map.setCenter({ lat: userLat, lng: userLng });
        });
    } else {
        alert("Geolocation is not supported by this browser.");
    }



    document.getElementById('btnGetLocation').addEventListener('click', function () {
        navigator.geolocation.getCurrentPosition(function (position) {
            var userLat = position.coords.latitude;
            var userLng = position.coords.longitude;
            map.setCenter({ lat: userLat, lng: userLng });
        });
    });
}








window.initMap = initMap;