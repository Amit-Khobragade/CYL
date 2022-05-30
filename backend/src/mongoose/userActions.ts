import { userModel } from "./database";
import mongoose from "mongoose";
import validator from "validator";

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

export async function getUserById(_id: any) {
  return await userModel.findById(_id).exec();
}

export async function login(email: string, password: string) {
  if (
    !validator.matches(password, /[$/\;:"',<>.?\)\(%]/g) &&
    !validator.isEmail(email)
  ) {
    return "server error";
  }
  return await userModel.findOne({ email: email }).exec();
}

export const checkJwt = (_id: string, jwt: string) => !!getUserById(_id);

export async function makeUserStore(_id: string, jwt: string) {
  let user = await getUserById(_id);
  if (!!user) {
    await userModel.findByIdAndUpdate(_id, { isStore: true }).exec();
  }
  return user;
}

export async function trustUser(_id: string, jwt: string) {
  let user = await getUserById(_id);
  if (!!user && user.isStore) {
    await userModel.findByIdAndUpdate(_id, { isTrusted: true }).exec();
  }
  return user;
}
