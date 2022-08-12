function initMap() {
  new google.maps.Map(document.getElementById("map"), {
    mapId: "4d7ece8ee77fe4c0",
    center: { lat: 48.85, lng: 2.35 },
    zoom: 5,
	panControl: false,
  	zoomControl: false,
  	mapTypeControl: false,
 	scaleControl: false,
 	streetViewControl: false,
 	overviewMapControl: false
  });
}

window.initMap = initMap;

/*JSON*/
[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d5d5d5"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "stylers": [
      {
        "weight": 1
      }
    ]
  },
  {
    "featureType": "road.highway",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.local",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "water",
    "stylers": [
      {
        "color": "#ade8f4"
      }
    ]
  }
]