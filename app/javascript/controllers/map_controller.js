import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Hello, leaflet map!", this.element);
        
        let latInput = document.querySelector("#report_latitude");
        let longInput = document.querySelector("#report_longitude");

        var map = L.map('map').setView([-1.2921, 36.8219], 13);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
    
        // TODO: Ask the server for a list of lats and lons of crimes and add markers for all of them on the map
        var marker = L.marker([-1.2921, 36.8219]).addTo(map);
        marker.bindPopup("<b>Crime Report:</b><br>guns fired").openPopup();

        // TODO: Users Can click on map and specify that's where the crime occured, anytime the user clicks, this should be reflected on two fields lat and longitude
        map.on('click', function(e) {        
            var popLocation= e.latlng;
            var popup = L.popup()
            .setLatLng(popLocation)
            .setContent('<p>Pin this as location of crime</p>')
            .openOn(map);        
            console.log(popLocation)

            latInput.value = popLocation.lat;
            longInput.value = popLocation.lng;
        });
    }
}