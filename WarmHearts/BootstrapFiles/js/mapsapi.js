////function initMap() {
////    const map = new google.maps.Map(document.getElementById("map"), {
////        zoom: 8,
////        center: { lat: 10.311780, lng: 123.916412 },
////    });
////    const infoWindow = new google.maps.InfoWindow({
////        content: "",
////        disableAutoPan: true,
////    });
////    const infoWindow2 = new google.maps.InfoWindow2({
////        content2: "",
////        disableAutoPan2: true,
////    });
////    // Create an array of alphabetical characters used to label the markers.
////    // Add some markers to the map.
////    const marker = new google.maps.Marker({
////        position: { lat: 10.311780, lng: 123.916412 },
////        map: map,
////        label: "A",
////        title: "Warmhearts",
////        draggable: false,
////        icon: "",
////        draggable: true,
////        disableAutoPan: true,
////        animation: google.maps.Animation.DROP,



////    });
////    const marker2 = new google.maps.Marker({
////        position: { lat: 10.15, lng: 123.15 },
////        map: map,
////        label: "B",
////        title: "Warmhearts",
////        draggable: false,
////        icon: "",
////        draggable: true,
////        disableAutoPan: true,
////        animation: google.maps.Animation.DROP,



////    });

////    marker.addListener("click", () => {
////        infoWindow.setContent("DSWD");
////        infoWindow.open(map, marker);
////    });
////    return marker;

////    marker2.addListener("click", () => {
////        infoWindow2.setContent("DSWD2");
////        infoWindow2.open(map, marker2);
////    });
////    return marker2;
////}



////window.initMap = initMap;

// The following example creates five accessible and
// focusable markers.
function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 12,
        center: { lat: 10.311780, lng: 123.916412 },
    });
    // Set LatLng and title text for the markers. The first marker (Boynton Pass)
    // receives the initial focus when tab is pressed. Use arrow keys to
    // move between markers; press tab again to cycle through the map controls.
    const tourStops = [
        [{ lat: 10.311780, lng: 123.916412 }, "Cebu City"],
        [{ lat: 10.333333, lng: 123.933334 }, "Mandaue City"],
        [{ lat: 10.266182, lng: 123.997292 }, "Lapu=lapu"],
        [{ lat: 10.243889, lng: 123.833336 }, "Talisay City"],
        [{ lat: 10.243302, lng: 123.788994 }, "Minglanilla"],
    ];
    // Create an info window to share between markers.
    const infoWindow = new google.maps.InfoWindow();

    // Create the markers.
    tourStops.forEach(([position, title], i) => {
        const marker = new google.maps.Marker({
            position,
            map,
            title: `${i + 1}. ${title}`,
            label: `${i + 1}`,
            optimized: false,
            draggable: true,
        });

        // Add a click listener for each marker, and set up the info window.
        marker.addListener("click", () => {
            infoWindow.close();
            infoWindow.setContent(marker.getTitle());
            infoWindow.open(marker.getMap(), marker);
        });
    });
}

window.initMap = initMap;