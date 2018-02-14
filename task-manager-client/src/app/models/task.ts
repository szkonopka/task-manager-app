export class Task {
    ID: number;
    Name: string;
    TaskRegisterID: number;
    Deadline: Date;
    DateOfCreation: Date;
    IsDone: boolean;
    Reminder: boolean;
    IsInArchive: boolean;
    UserID: number;
    contructor(
        ID: number = null,
        Name: string = '',
        TaskRegisterID: number = null,
        Deadline: Date = null,
        DateOfCreation: Date = null,
        IsDone: boolean = null,
        Reminder: boolean = null,
        IsInArchive: boolean = null,
        UserID: number = null,
    )
    {
        this.ID = ID;
        this.Name = Name;
        this.TaskRegisterID = TaskRegisterID;
        this.Deadline = Deadline;
        this.DateOfCreation = DateOfCreation;
        this.IsDone = IsDone;
        this.Reminder = Reminder;
        this.IsInArchive = IsInArchive;
        this.UserID = UserID;
    }
}
