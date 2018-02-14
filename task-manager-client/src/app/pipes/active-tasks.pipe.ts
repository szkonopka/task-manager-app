import { Pipe, PipeTransform } from '@angular/core';
import { Task } from '../models/task';
@Pipe({
  name: 'activeTasks',
  pure: false
})
export class ActiveTasksPipe implements PipeTransform {
  transform(tasks: Task[], archive: boolean, registerId: number, done: boolean): Task[] {
    if(tasks != null) {
      if(done == true)
          return tasks.filter(task => 
            task['isDone'] === true);
            
      if(archive === true && registerId == null)
        return tasks.filter(task => task['isInArchive'] === true);
    
      if(archive === false && registerId === null)
        return tasks.filter(task => task['isInArchive'] === false && task['isDone'] === false);

      if(archive === false && registerId !== null)
        return tasks.filter(task => 
          task['isInArchive'] === false && 
          task['taskRegisterID'] === registerId &&
          task['isDone'] === false);
    }
    
    return tasks;
  }

}
