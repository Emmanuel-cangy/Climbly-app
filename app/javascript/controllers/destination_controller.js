import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    console.log('connected')
    let directions = new MapboxDirections({
      accessToken: mapboxgl.accessToken,
      unit: 'metric',
      profile: 'mapbox/driving',
      controls: {instructions: false}
    });

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })


    this.map.addControl(directions, 'top-left');
    this.#addMarkersToMap();

    navigator.geolocation.getCurrentPosition(position => {
      const { latitude, longitude } = position.coords;
      // window.location.reload()
      if (this.map.loaded()) {
        directions.setOrigin([longitude, latitude]);
        directions.setDestination([this.markersValue[0].lng, this.markersValue[0].lat]);
      } else {
        this.map.on("load", () => {
          directions.setOrigin([longitude, latitude]);
          directions.setDestination([this.markersValue[0].lng, this.markersValue[0].lat]);
        })
      }
     })



    this.map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserHeading: true,
      showUserLocation: true,

    }));
  }

  #addMarkersToMap() {
    // window.location.reload();


    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "15px"
      customMarker.style.height = "25px"

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    });
  }

}
