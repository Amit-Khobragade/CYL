import mongoose from "mongoose";
import { UserSchema, ProductSchema, OrderSchema } from "./schemas";

const userColName = "user";

let DB: mongoose.Connection = mongoose.createConnection(
  process.env.DB as string
);
DB.on("error", () => {
  console.error("Database error");
  process.exit();
});

DB.on("open", () => console.log("Created connection"));

export const userModel = DB.model("users", UserSchema);
export const productModel = DB.model("products", ProductSchema);
export const orderModel = DB.model("orders", OrderSchema);
