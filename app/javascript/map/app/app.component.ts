import { Component } from '@angular/core';

@Component({
  selector: 'map',
  template: `<h3>Here will {{name}}</h3>`
})
export class AppComponent {
  name = 'Map!';
}
