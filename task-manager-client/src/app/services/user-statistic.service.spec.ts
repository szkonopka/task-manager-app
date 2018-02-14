import { TestBed, inject } from '@angular/core/testing';

import { UserStatisticService } from './user-statistic.service';

describe('UserStatisticService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [UserStatisticService]
    });
  });

  it('should be created', inject([UserStatisticService], (service: UserStatisticService) => {
    expect(service).toBeTruthy();
  }));
});
