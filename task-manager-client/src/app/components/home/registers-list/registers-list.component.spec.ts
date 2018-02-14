import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistersListComponent } from './registers-list.component';

describe('RegistersListComponent', () => {
  let component: RegistersListComponent;
  let fixture: ComponentFixture<RegistersListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegistersListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegistersListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
