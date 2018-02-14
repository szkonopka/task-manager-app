import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TasksRegisterEditorComponent } from './tasks-register-editor.component';

describe('TasksRegisterAdderComponent', () => {
  let component: TasksRegisterEditorComponent;
  let fixture: ComponentFixture<TasksRegisterEditorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TasksRegisterEditorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TasksRegisterEditorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
