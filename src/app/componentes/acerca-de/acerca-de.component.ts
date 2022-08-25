import { Component, OnInit } from '@angular/core';
import { persona } from 'src/app/model/persona.model';
import { PersonaService } from 'src/app/service/persona.service';
import { PortafolioService } from 'src/app/servicios/portafolio.service';

@Component({
  selector: 'app-acerca-de',
  templateUrl: './acerca-de.component.html',
  styleUrls: ['./acerca-de.component.css']
})
export class AcercaDeComponent implements OnInit {
  //persona: persona = new persona("","");
  miPortafolio:any;
  constructor(
    //public personaService: PersonaService,
    private datosPortafolio:PortafolioService, 
    ) { }

  ngOnInit(): void {
    //this.personaService.getPersona().subscribe(data => {this.persona = data});
    this.datosPortafolio.obtenerDatos().subscribe(data =>{
      console.log(data);
      this.miPortafolio=data;
    });
  }

}
