import mongoose from "mongoose";
import { UserSchema } from "./schemas";

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