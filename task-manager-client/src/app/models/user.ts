export class User {
    ID: number;
    FirstName: string;
    LastName: string;
    Username: string;
    Email: string;
    Password: string;
    
    constructor(
        ID: number,
        FirstName: string,
        LastName: string,
        Username: string,
        Email: string,
        Password: string,
    ) {
        this.ID = ID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Username = Username;
        this.Email = Username;
        this.Password = Password;
    }
}
