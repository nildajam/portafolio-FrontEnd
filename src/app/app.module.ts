import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EncabezadoComponent } from './componentes/encabezado/encabezado.component';
import { AcercaDeComponent } from './componentes/acerca-de/acerca-de.component';
import { ExpeEducCursosComponent } from './componentes/expe-educ-cursos/expe-educ-cursos.component';
import { SkillsComponent } from './componentes/skills/skills.component';
import { ProyectosComponent } from './componentes/proyectos/proyectos.component';
import { PortafolioService } from './service/portafolio.service';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { IniciarSesionComponent } from './componentes/iniciar-sesion/iniciar-sesion.component';
import { PortafolioComponent } from './componentes/portafolio/portafolio.component';
import { ReactiveFormsModule } from '@angular/forms';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    EncabezadoComponent,
    AcercaDeComponent,
    ExpeEducCursosComponent,
    SkillsComponent,
    ProyectosComponent,
    IniciarSesionComponent,
    PortafolioComponent,
  ],

  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
  ],

  providers: [PortafolioService],
  bootstrap: [AppComponent],
})
export class AppModule {}
