import validator from "validator";

interface BaseUserData {
  email: string;
  phoneNumber: string;
  displayName: string;
  isStore?: boolean;
  isTrusted?: boolean;
}

export interface UserData extends BaseUserData {
  uid: string;
  jwt?: string;
}

export interface NewUserData extends BaseUserData {
  password: string;
}

function isBaseUserData(data: Object): data is BaseUserData {
  let baseUserData: BaseUserData = data as BaseUserData;
  return (
    !!baseUserData &&
    !!baseUserData.email &&
    !!baseUserData.phoneNumber &&
    !!baseUserData.displayName &&
    validator.isEmail(baseUserData.email) &&
    validator.isMobilePhone(baseUserData.phoneNumber) &&
    validator.isAlphanumeric(baseUserData.displayName)
  );
}

export function isUserData(data: Object): data is UserData {
  if (isBaseUserData(data)) {
    let userData: UserData = data as UserData;
    return (
      !!userData.uid &&
      validator.isAlphanumeric(userData.uid) &&
      (!userData.jwt || validator.isJWT(userData.jwt))
    );
  } else {
    return false;
  }
}

export function isNewUserData(data: Object): data is NewUserData {
  if (isBaseUserData(data)) {
    let userData: NewUserData = data as NewUserData;
    return (
      !!userData.password &&
      !validator.matches(userData.password, /[$/\;:"',<>.?\)\(%]/g)
    );
  } else {
    return false;
  }
}

export function createUser(user: NewUserData): UserData {
  let ret: UserData = {
    ...user,
    uid: randStr(),
    isStore: false,
    isTrusted: false,
  };
  return ret;
}

function randStr(): string {
  let x: string = "";
  for (let i in Array(10)) {
    x += Math.random() * 10;
  }
  return x;
}
