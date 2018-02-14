import { TestBed, inject } from '@angular/core/testing';

import { TasksRegisterService } from './tasks-register.service';

describe('TasksRegisterService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [TasksRegisterService]
    });
  });

  it('should be created', inject([TasksRegisterService], (service: TasksRegisterService) => {
    expect(service).toBeTruthy();
  }));
});
