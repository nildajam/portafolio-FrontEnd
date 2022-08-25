import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { IniciarSesionComponent } from './componentes/iniciar-sesion/iniciar-sesion.component'; //login
import { PortafolioComponent } from './componentes/portafolio/portafolio.component'; //home

const routes: Routes = [
  { path: '', component: PortafolioComponent }, //home
  { path: 'iniciar-sesion', component: IniciarSesionComponent }, //login
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
