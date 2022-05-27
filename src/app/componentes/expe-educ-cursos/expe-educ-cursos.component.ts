import { Component, OnInit } from '@angular/core';
import { PortafolioService } from 'src/app/servicios/portafolio.service';

@Component({
  selector: 'app-expe-educ-cursos',
  templateUrl: './expe-educ-cursos.component.html',
  styleUrls: ['./expe-educ-cursos.component.css']
})
export class ExpeEducCursosComponent implements OnInit {
  miPortafolio:any;
  constructor(private datosPortafolio:PortafolioService) { }

  ngOnInit(): void {
    this.datosPortafolio.obtenerDatos().subscribe(data =>{
      console.log(data);
      this.miPortafolio=data;
    });
  }

}
