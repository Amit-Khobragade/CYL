import { productModel } from "../database";
import { getUserById } from "./userActions";
import mongoose from "mongoose";
import { categories, subCategories } from "../schemas";
import validator from "validator";

export const getCategories = () => categories;

export function getSubCategories(cat: string): string[] | null {
  if (!categories.includes(cat)) {
    return null;
  }
  return subCategories[cat];
}

export async function addProducts(product: any) {
  const user = await getUserById(product.uid);
  if (!user || !user.isStore) {
    return false;
  }
  const newProduct: mongoose.Document = new productModel(product);
  const error = newProduct.validateSync();
  if (!!error) {
    return "server error";
  }
  return await newProduct.save();
}

export async function getProductById(_id: string) {
  return await productModel.findById(_id).exec();
}

export async function removeProduct(_id: string, password: string) {
  const product = await getProductById(_id);
  // TODO validate user
  return await productModel.findByIdAndDelete(_id).exec();
}

export const getProductByUid = async (uid: string) =>
  await productModel.find({ uid }).exec();

export async function getProdsByCtg(cat: string) {
  if (!categories.includes(cat)) {
    return null;
  }
  return await productModel.find({ category: cat }).exec();
}

export async function getProdsBySubCtg(cat: string, subc: string) {
  const products = await getProdsByCtg(cat);
  if (!products || !subCategories[cat].includes(subc)) {
    return [];
  }
  const prod = products.filter((val: any) => val.subCategory === subc);
  return prod;
}

export async function getProductsBySearch(searchKey: string) {
  if (validator.isAlphanumeric(searchKey)) {
    let data = await productModel.find({
      title: { $regex: `${searchKey}`, $options: "i" },
    });
    data.push(
      ...(await productModel.find({
        description: { $regex: `${searchKey}`, $options: "i" },
      }))
    );
    return data;
  }
}
