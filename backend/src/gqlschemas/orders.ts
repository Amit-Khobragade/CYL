import {
  GraphQLObjectType,
  GraphQLString,
  GraphQLID,
  GraphQLSchema,
  GraphQLList,
} from "graphql";
import * as data from "../mongoose/actions/orderActions";
import { getProductById } from "../mongoose/actions/productActions";
import { getUserById } from "../mongoose/actions/userActions";
import { productType } from "./products";
import { UserType } from "./users";

export const OrderType = new GraphQLObjectType({
  name: "order",
  fields: () => ({
    _id: { type: GraphQLID },
    uid: { type: GraphQLID },
    pid: { type: GraphQLID },
    deliveryAddr: { type: GraphQLString },
    user: {
      type: UserType,
      resolve: async (parent, args) => {
        return await getUserById(parent.uid);
      },
    },
    product: {
      type: productType,
      resolve: async (parent, args) => {
        return await getProductById(parent.pid);
      },
    },
  }),
});

const query = new GraphQLObjectType({
  name: "OrdersRootQuery",
  fields: () => ({
    order: {
      type: OrderType,
      args: {
        _id: { type: GraphQLID },
      },
      resolve: (parent, args) => data.getOrderById(args._id),
    },
    userOrders: {
      type: new GraphQLList(OrderType),
      args: {
        uid: { type: GraphQLID },
      },
      resolve: (parent, args) => data.getUserOrders(args.uid),
    },
    productOrders: {
      type: new GraphQLList(OrderType),
      args: {
        pid: { type: GraphQLID },
      },
      resolve: (parent, args) => data.getProductOrders(args.pid),
    },
  }),
});

const mutation = new GraphQLObjectType({
  name: "OrderMutationQuery",
  fields: () => ({
    placeOrder: {
      type: OrderType,
      args: {
        uid: { type: GraphQLID },
        pid: { type: GraphQLID },
        deliveryAddr: { type: GraphQLString },
        jwt: { type: GraphQLString },
      },
      resolve: (parent, args) =>
        data.placeOrder(args.uid, args.pid, args.deliveryAddr, args.jwt),
    },
    cancelOrder: {
      type: OrderType,
      args: {
        _id: { type: GraphQLID },
        uid: { type: GraphQLID },
        jwt: { type: GraphQLString },
      },
      resolve: (parent, args) => data.cancelOrder(args._id, args.uid, args.jwt),
    },
  }),
});

const orderSchema: GraphQLSchema = new GraphQLSchema({ query, mutation });
export default orderSchema;
