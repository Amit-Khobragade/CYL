import {
  UserData,
  NewUserData,
  isUserData,
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

export function addUser(newUser: NewUserData): UserData | null {
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

export function getUserById(uid: string): UserData | undefined {
  return database.find((value) => value.uid === uid);
}

export function makeUserStore(uid: string): UserData | undefined {
  let user = getUserById(uid);
  user && (user.isStore = true);
  return user;
}

export function trustUser(uid: string): UserData | undefined {
  let user = getUserById(uid);
  user && user.isStore && (user.isTrusted = true);
  return user;
}
