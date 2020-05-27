// initialize the map on the "map" div with a given center and zoom
var map = new L.Map('map', {
  zoom: 6,
  minZoom: 3,
});

// create a new tile layer
var tileUrl = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
layer = new L.TileLayer(tileUrl,
{
    attribution: 'Maps © <a href=\"www.openstreetmap.org/copyright\">OpenStreetMap</a> contributors',
    maxZoom: 18
});

// add the layer to the map
map.addLayer(layer);


var zhpartoulouse = [
    [47.547, 8.602],
	[48.857, 2.351], [44.8439, -0.5795],
	[43.811,1.472], [45.7052, 4.7406],
	[46.2032, 6.1466],[47.547, 8.602]
];


map.fitBounds(zhpartoulouse);

//========================================================================
var marker1 = L.Marker.movingMarker(zhpartoulouse, [2000,10000,3000,2000,500,500,500,500]).addTo(map);
L.polyline(zhpartoulouse).addTo(map);
marker1.once('click', function () {
    marker1.start();
    marker1.closePopup();
    marker1.unbindPopup();
    marker1.on('click', function() {
        if (marker1.isRunning()) {
            marker1.pause();
        } else {
            marker1.start();
        }
    });
});


