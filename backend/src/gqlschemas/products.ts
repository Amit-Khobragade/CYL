import * as data from "../mongoose/actions/productActions";
import {
  GraphQLObjectType,
  GraphQLString,
  GraphQLBoolean,
  GraphQLSchema,
  GraphQLList,
  GraphQLID,
  GraphQLScalarType,
} from "graphql";
import { UserType } from "./users";
import { getUserById } from "../mongoose/actions/userActions";

export const productType = new GraphQLObjectType({
  name: "products",
  fields: () => ({
    _id: { type: GraphQLID },
    uid: { type: GraphQLID },
    title: { type: GraphQLString },
    description: { type: GraphQLString },
    url: { type: new GraphQLList(GraphQLString) },
    category: { type: GraphQLString },
    subCategory: { type: GraphQLString },
    user: {
      type: UserType,
      resolve: (parent, args) => getUserById(parent.uid),
    },
  }),
});

const query = {
  products: {
    type: new GraphQLList(productType),
    args: { uid: { type: GraphQLID } },
    resolve: (parent: any, args: any) => data.getProductByUid(args.uid),
  },
  product: {
    type: productType,
    args: { _id: { type: GraphQLID } },
    resolve: (parent: any, args: any) => data.getProductById(args._id),
  },
  categories: {
    type: new GraphQLList(GraphQLString),
    resolve: (parent: any, args: any) => data.getCategories(),
  },
  subCategories: {
    type: new GraphQLList(GraphQLString),
    args: { category: { type: GraphQLString } },
    resolve: (parent: any, args: any) => data.getSubCategories(args.category),
  },
  productsByCategory: {
    type: new GraphQLList(productType),
    args: { category: { type: GraphQLString } },
    resolve: (parent: any, args: any) => data.getProdsByCtg(args.category),
  },
  productsBySubCategory: {
    type: new GraphQLList(productType),
    args: {
      category: { type: GraphQLString },
      subCategory: { type: GraphQLString },
    },
    resolve: (parent: any, args: any) =>
      data.getProdsBySubCtg(args.category, args.subCategory),
  },
  search: {
    type: new GraphQLList(productType),
    args: { search: { type: GraphQLString } },
    resolve: (parent: any, args: any) => data.getProductsBySearch(args.search),
  },
};

const mutation = {
  addProduct: {
    type: productType,
    args: {
      uid: { type: GraphQLID },
      title: { type: GraphQLString },
      description: { type: GraphQLString },
      url: { type: new GraphQLList(GraphQLString) },
      category: { type: GraphQLString },
      subCategory: { type: GraphQLString },
    },
    resolve: (parent: any, args: any) => data.addProducts(args),
  },
  removeProduct: {
    type: productType,
    args: {
      _id: { type: GraphQLID },
      password: { type: GraphQLString },
    },
    resolve: (parent: any, args: any) =>
      data.removeProduct(args._id, args.password),
  },
};

// const productSchema: GraphQLSchema = new GraphQLSchema({ query, mutation });
const product = { query, mutation };
// export default productSchema;
export default product;
