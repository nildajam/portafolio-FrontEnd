import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExpeEducCursosComponent } from './expe-educ-cursos.component';

describe('ExpeEducCursosComponent', () => {
  let component: ExpeEducCursosComponent;
  let fixture: ComponentFixture<ExpeEducCursosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExpeEducCursosComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ExpeEducCursosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
