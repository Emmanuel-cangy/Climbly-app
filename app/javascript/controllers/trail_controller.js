import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    route: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [this.routeValue[0][0], this.routeValue[0][1]],
      zoom: 13
    })

    this.#addMarkersToMap();

    this.map.on('load', () => {
      this.map.addSource('route', {
        'type': 'geojson',
        'data': {
          "type": "FeatureCollection",
            "features": [
                {
                    "type": "Feature",
                    "properties": {
                        "name": "new",
                        "type": "Cycling"
                    },
                    "geometry": {
                        "type": "LineString",
                        "coordinates":
                          this.routeValue
                    }
                }
            ]
        }  // geojson data here
      })
      this.map.addLayer({
        'id': 'route',
        'type': 'line',
        'source': 'route',
        'layout': {
          'line-join': 'round',
          'line-cap': 'round'
        },
        'paint': {
          'line-color': '#FE0103',
          'line-width': 8
        }
    });
    })

    this.map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserHeading: true,
      showUserLocation: true,
      fitBoundsOptions: {maxZoom:15}
    }));
  }

  #addMarkersToMap() {
    new mapboxgl.Marker()
      .setLngLat([ this.routeValue[0][0], this.routeValue[0][1] ])
      .addTo(this.map)
  }

}
