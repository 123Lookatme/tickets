window.initMap = function (points) {
    var map_div = document.getElementById('map');

    if (map_div == null) {
        return;
    }

    var polygon_points = points.map(function (lat_lng) {
        return {
            "lat": lat_lng[0],
            "lng": lat_lng[1]
        }
    })

    var polygon = new google.maps.Polygon({
        paths: polygon_points,
        strokeColor: '#FF0000',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#FF0000',
        fillOpacity: 0.35
    });
    var map = new google.maps.Map(map_div, {
        zoom: 10,
        center: polygon_points[0],
        mapTypeId: 'terrain'
    });

    polygon.setMap(map);
}