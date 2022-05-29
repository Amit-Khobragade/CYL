import { Schema } from "mongoose";
import validator from "validator";

export const UserSchema = new Schema(
  {
    email: {
      type: String,
      validate: validator.isEmail,
      unique: true,
      required: true,
    },
    phoneNumber: {
      type: String,
      validate: validator.isMobilePhone,
      unique: true,
      required: true,
    },
    displayName: {
      type: String,
      validate: validator.isAlphanumeric,
      required: true,
    },
    isStore: {
      type: Boolean,
      default: false,
    },
    isTrusted: {
      type: Boolean,
      default: false,
    },
  },
  {
    strict: true,
    strictQuery: true,
  }
);
