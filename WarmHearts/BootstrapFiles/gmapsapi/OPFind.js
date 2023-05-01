

                                     function myMap() {
                                         var lat = <%=this.lats %>;
                                         var lon = <%=this.lons %>;

                                         var prty = {
                                             center: new google.maps.LatLng(lat, lon),
                                             zoom: 15,
                                         };
                                         var map = new google.maps.Map(document.getElementById("map"), prty);
                                         const mapCenter = new google.maps.LatLng(lat, lon);
                                         var marker = new google.maps.Marker({ position: mapCenter });
                                        
                                         marker.setMap(map);


                                     }
                                   
                            