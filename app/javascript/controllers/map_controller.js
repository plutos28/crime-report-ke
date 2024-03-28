import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Hello, leaflet map!", this.element);
        
        let latInput;
        let longInput;

        document.addEventListener('turbo:frame-load', function(event) {
            latInput = document.querySelector("#report_latitude");
            longInput = document.querySelector("#report_longitude");
            
            console.log(latInput);
            console.log(longInput);

            fetch("/reports/map_data")
            .then(res => res.json())
            .then(data => {
                data.forEach(report => {
                    if(report.latitude != null && report.longitude != null) {
                        L.circle({lat: report.latitude, lng: report.longitude}, {
                            color: 'steelblue',
                            radius: 500,
                            fillColor: 'red',
                            opacity: 0.5
                        }).addTo(map)

                        L.marker([report.latitude, report.longitude]).addTo(map)
                        .bindPopup(`<p>${report.title}<br>Crime Commited: ${report.type_of_crime}</p> <br> <img style="width: 150px;height: 150px;" src='${report.photo_url}'>`);
                    }
                });
            });

        });

        latInput = document.querySelector("#report_latitude");
        longInput = document.querySelector("#report_longitude");
        console.log(latInput);
        console.log(longInput);

        var map = L.map('map').setView([-1.2921, 36.8219], 13);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
    
        // TODO: Ask the server for a list of lats and lons of crimes and add markers for all of them on the map
        fetch("/reports/map_data")
            .then(res => res.json())
            .then(data => {
                data.forEach(report => {
                    if(report.latitude != null && report.longitude != null) {
                        L.circle({lat: report.latitude, lng: report.longitude}, {
                            color: 'steelblue',
                            radius: 500,
                            fillColor: 'red',
                            opacity: 0.5
                        }).addTo(map)

                        L.marker([report.latitude, report.longitude]).addTo(map)
                        .bindPopup(`<p>${report.title}<br>Crime Commited: ${report.type_of_crime}</p> <br> <img style="width: 150px;height: 150px;" src='${report.photo_url}'>`);
                    }
                });
            });

        // Users Can click on map and specify that's where the crime occured, anytime the user clicks, this should be reflected on two fields lat and longitude
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