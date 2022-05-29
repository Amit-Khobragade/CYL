import { userModel } from "./database";
import mongoose from "mongoose";
import validator from "validator";

function errorHandler(err: any, usr: any) {
  console.error(err);
}

export async function addUser(data: any): Promise<any> {
  let newUser: mongoose.Document = new userModel(data);
  let validationResults = newUser.validateSync();
  if (validationResults) {
    return null;
  }

  return await newUser.save();
}

export async function getAllUsers(password: string) {
  if (password !== process.env.pass) {
    return "server error";
  }
  return await userModel.find({});
}

export const getUserById = (uid: string) =>
  userModel.findById(uid, null, errorHandler);

export async function login(email: string, password: string) {
  if (
    validator.matches(password, /[$/\;:"',<>.?\)\(%]/g) &&
    validator.isEmail(email)
  ) {
    return "server error";
  }
  return await userModel.find({ email });
}

export const checkJwt = (_id: string, jwt: string) => !!getUserById(_id);

export const makeUserStore = (uid: string, jwt: string) =>
  userModel.findByIdAndUpdate(uid, { isStore: true }, errorHandler);

export function trustUser(uid: string, jwt: string) {
  let user = getUserById(uid);
  user &&
    user.isStore &&
    userModel.findByIdAndUpdate(uid, { isTrusted: true }, errorHandler);
  return user;
}
