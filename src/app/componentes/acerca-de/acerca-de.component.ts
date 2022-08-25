import { Component, OnInit } from '@angular/core';
import { PortafolioService } from 'src/app/service/portafolio.service';

@Component({
  selector: 'app-acerca-de',
  templateUrl: './acerca-de.component.html',
  styleUrls: ['./acerca-de.component.css'],
})
export class AcercaDeComponent implements OnInit {
  miPortafolio: any;
  constructor(private datosPortafolio: PortafolioService) {}

  ngOnInit(): void {
    this.datosPortafolio.obtenerDatos().subscribe((data) => {
      this.miPortafolio = data;
    });
  }
}
