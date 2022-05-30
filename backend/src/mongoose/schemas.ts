import { isValidObjectId, Schema, Types } from "mongoose";
import validator from "validator";

export const categories = ["face", "eyes", "lips", "kits"];
export const subCategories: { [key: string]: string[] } = {
  face: [
    "Face Primer",
    "Concealer",
    "Foundation",
    "Compact",
    "Contour",
    "Blush",
    "Bronzer",
    "Highlighters",
  ],
  eyes: [
    "Kajal",
    "Eyeliner",
    "Mascara",
    "Eye Shadow",
    "Eye Brow Enhancers",
    "Eye Primer",
    "False Eyelashes",
    "Eye Makeup Remover",
    "Under Eye Concealer",
  ],
  lips: [
    "Lipstick",
    "Liquid Lipstick",
    "Lip Gloss",
    "Lip Liner",
    "Lip Plumper",
    "Lip Stain",
    "Lip Balm",
  ],
  kits: [
    "Nail Polish",
    "Nail Art Kits",
    "Nail Polish Sets",
    "Nail Care",
    "Nail Polish Remover",
    "Manicure & Pedicure Kits",
  ],
};

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
    isStore: { type: Boolean, default: false },
    isTrusted: { type: Boolean, default: false },
  },
  {
    strict: true,
    strictQuery: true,
  }
);

export const ProductSchema = new Schema({
  uid: { type: Types.ObjectId, validate: isValidObjectId, required: true },
  title: { type: String, validate: validator.isAlphanumeric, required: true },
  description: {
    type: String,
    validate: validator.isAlphanumeric,
    required: true,
  },
  url: {
    type: [String],
    validate: (ar: String[]) => ar.every((val) => validator.isURL(String(val))),
  },
  category: {
    type: String,
    required: true,
    validate: (val: string) => categories.includes(val),
  },
  subCategory: {
    type: String,
    required: true,
    validate: function (val: string) {
      const category = (this as any).category;
      if (!categories.includes(category)) {
        return false;
      }
      subCategories[category].includes(val);
    },
  },
});

export const OrderSchema = new Schema({
  uid: { type: Types.ObjectId, validate: isValidObjectId, required: true },
  pid: { type: Types.ObjectId, validate: isValidObjectId, required: true },
  deliveryAddr: { type: String, required: true },
});
