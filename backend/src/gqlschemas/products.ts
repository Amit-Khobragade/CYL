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

const query = new GraphQLObjectType({
  name: "RootProductQueryType",
  fields: {
    products: {
      type: new GraphQLList(productType),
      args: { uid: { type: GraphQLID } },
      resolve: (parent, args) => data.getProductByUid(args.uid),
    },
    product: {
      type: productType,
      args: { _id: { type: GraphQLID } },
      resolve: (parent, args) => data.getProductById(args._id),
    },
    categories: {
      type: new GraphQLList(GraphQLString),
      resolve: (parent, args) => data.getCategories(),
    },
    subCategories: {
      type: new GraphQLList(GraphQLString),
      args: { category: { type: GraphQLString } },
      resolve: (parent, args) => data.getSubCategories(args.category),
    },
    productsByCategory: {
      type: new GraphQLList(productType),
      args: { category: { type: GraphQLString } },
      resolve: (parent, args) => data.getProdsByCtg(args.category),
    },
    productsBySubCategory: {
      type: new GraphQLList(productType),
      args: {
        category: { type: GraphQLString },
        subCategory: { type: GraphQLString },
      },
      resolve: (parent, args) =>
        data.getProdsBySubCtg(args.category, args.subCategory),
    },
  },
});

const mutation = new GraphQLObjectType({
  name: "ProductsRootMutations",
  fields: {
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
      resolve: (parent, args) => data.addProducts(args),
    },
    removeProduct: {
      type: productType,
      args: {
        _id: { type: GraphQLID },
        password: { type: GraphQLString },
      },
      resolve: (parent, args) => data.removeProduct(args._id, args.password),
    },
  },
});

const productSchema: GraphQLSchema = new GraphQLSchema({ query, mutation });
export default productSchema;
