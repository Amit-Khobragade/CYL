import { orderModel } from "../database";
import validator from "validator";
import mongoose from "mongoose";
import { getUserById } from "./userActions";
import { getProductById } from "./productActions";

export async function placeOrder(
  uid: any,
  pid: any,
  deliveryAddr: string,
  jwt: string
) {
  const user = await getUserById(uid);
  if (!user || !(await getProductById(pid))) {
    return "server Error";
  }
  const doc: mongoose.Document = new orderModel({ pid, uid, deliveryAddr });
  return await doc.save();
}

export async function cancelOrder(_id: any, uid: any, jwt: string) {
  if (mongoose.isValidObjectId(uid) && mongoose.isValidObjectId(_id)) {
    return await orderModel.findByIdAndRemove(_id).exec();
  }
}

export async function getOrderById(_id: any) {
  if (mongoose.isValidObjectId(_id)) {
    return await orderModel.findById(_id).exec();
  }
}

export async function getUserOrders(uid: string) {
  if (mongoose.isValidObjectId(uid)) {
    return await orderModel
      .find({ uid: new mongoose.Types.ObjectId(uid) })
      .exec();
  }
}

export async function getProductOrders(pid: any) {
  if (mongoose.isValidObjectId(pid)) {
    return await orderModel.find({ pid }).exec();
  }
}
