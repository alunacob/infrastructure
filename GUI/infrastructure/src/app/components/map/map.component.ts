import { Component, OnInit } from '@angular/core';
import * as L from 'leaflet';

@Component({
  selector: 'app-map',
  templateUrl: './map.component.html',
  styleUrls: ['./map.component.sass']
})
export class MapComponent implements OnInit {
  options = {
    layers: [
      L.gridLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png')
    ],
    zoom: 5,
    center: L.latLng(46.879966, -121.726909)
  };
  
  constructor() {

   }

  ngOnInit(): void {
    
  }

}
