import {
  UserData,
  NewUserData,
  isNewUserData,
  createUser,
} from "../interfaces";

const database: UserData[] = [
  {
    uid: "2e12132321xe",
    email: "aman@kks.com",
    phoneNumber: "+919272737191",
    displayName: "aman",
  },
  {
    uid: "2e121df323e",
    email: "amdn@kks.com",
    phoneNumber: "+919272737192",
    displayName: "sdsd",
  },
  {
    uid: "2e1213238741ce",
    email: "aman@kfh.com",
    phoneNumber: "+919272737193",
    displayName: "amaan",
  },
  {
    uid: "2e34232321xe",
    email: "asdn@kks.com",
    phoneNumber: "+919272737194",
    displayName: "andn",
  },
  {
    uid: "2e12143321xe",
    email: "a72@kks.com",
    phoneNumber: "+919272737195",
    displayName: "aman",
  },
  {
    uid: "2e12132321xe",
    email: "a2ded@kks.com",
    phoneNumber: "+919272737196",
    displayName: "ade",
  },
];

export function addUser(newUser: any): UserData | null {
  if (!isNewUserData(newUser)) {
    return null;
  }

  let user: UserData = createUser(newUser);
  database.push(user);
  return user;
}

export function getAllUsers(): UserData[] {
  return database;
}

export function login(email: String, password: String): UserData | undefined {
  let user = database.find((data) => data.email === email);
  !!user ? (user.jwt = "placeholder") : null;
  return user;
}

export function checkJwt(uid: string, jwt: string): boolean {
  return true;
}

export function getUserById(uid: string): UserData | undefined {
  return database.find((value) => value.uid === uid);
}

export function makeUserStore(uid: string, jwt: string): UserData | undefined {
  let user = getUserById(uid);
  user && (user.isStore = true);
  return user;
}

export function trustUser(uid: string, jwt: string): UserData | undefined {
  let user = getUserById(uid);
  user && user.isStore && (user.isTrusted = true);
  return user;
}
