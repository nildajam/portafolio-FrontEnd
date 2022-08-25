import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from 'src/app/service/token.service';
import { PortafolioService } from 'src/app/service/portafolio.service';

@Component({
  selector: 'app-encabezado',
  templateUrl: './encabezado.component.html',
  styleUrls: ['./encabezado.component.css'],
})
export class EncabezadoComponent implements OnInit {
  isLogged = false;
  miPortafolio: any;

  constructor(
    private datosPortafolio: PortafolioService,
    private router: Router,
    private tokenService: TokenService
  ) {}

  ngOnInit(): void {
    if (this.tokenService.getToken()) {
      this.isLogged = true;
    } else {
      this.isLogged = false;
    }

    this.datosPortafolio.obtenerDatos().subscribe((data) => {
      console.log(data);
      this.miPortafolio = data;
    });
  }

  onLogOut(): void {
    this.tokenService.logout();
    window.location.reload();
  }

  login() {
    this.router.navigate(['/iniciar-sesion']);
  }
}
