import { LightningElement, api } from 'lwc';

export default class HelloLWcomponent1 extends LightningElement {
  @api invoke() {
    console.log("Hi, I'm an action.");
  }
    mapOptions = {
        'disableDefaultUI': false, // when true disables Map|Satellite, +|- zoom buttons
        'draggable': true, // when false prevents panning by dragging on the map
      };
      
      mapMarkers = [
        {
          location: {
            City: 'San Francisco',
            Country: 'United States',
            PostalCode: '94102',
            State: 'CA',
            Street: '100 Larkin St',
          },
          mapIcon : {
            path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
            fillColor: '#CF3476',
            fillOpacity: .5,
            strokeWeight: 1,
            scale: .10,
          }
        }
      ];
}