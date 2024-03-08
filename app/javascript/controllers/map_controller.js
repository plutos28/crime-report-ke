import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Hello, leaflet map!", this.element);

        var map = L.map('map').setView([-1.2921, 36.8219], 13);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
    
        var marker = L.marker([-1.2921, 36.8219]).addTo(map);
        marker.bindPopup("<b>Crime Report:</b><br>guns fired").openPopup();
    }
}