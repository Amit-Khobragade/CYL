import * as data from "../Data/userData";
import {
  GraphQLObjectType,
  GraphQLString,
  GraphQLBoolean,
  GraphQLSchema,
  GraphQLList,
} from "graphql";
import { isNewUserData, isUserData, UserData } from "../interfaces";

const UserType = new GraphQLObjectType({
  name: "users",
  fields: () => ({
    uid: { type: GraphQLString },
    email: { type: GraphQLString },
    phoneNumber: { type: GraphQLString },
    displayName: { type: GraphQLString },
    isStore: { type: GraphQLBoolean },
    isTrusted: { type: GraphQLBoolean },
    jwt: { type: GraphQLString },
  }),
});

const schema: GraphQLSchema = new GraphQLSchema({
  query: new GraphQLObjectType({
    name: "RootQueryType",
    fields: {
      user: {
        type: UserType,
        args: {
          uid: { type: GraphQLString },
        },
        resolve: (parent, args): UserData | undefined =>
          data.getUserById(args.uid),
      },
      checkJwt: {
        type: GraphQLBoolean,
        args: {
          uid: { type: GraphQLString },
          jwt: { type: GraphQLString },
        },
        resolve: (parent, args): Boolean => data.checkJwt(args.uid, args.jwt),
      },
      //! DEVELOPER END POINT MUST BE REMOVED BEFORE PRODUCTION
      users: {
        type: new GraphQLList(UserType),
        resolve: (parent, args): UserData[] => data.getAllUsers(),
      },
    },
  }),

  mutation: new GraphQLObjectType({
    name: "RootMutationType",
    fields: {
      userLogin: {
        type: UserType,
        args: {
          email: { type: GraphQLString },
          password: { type: GraphQLString },
        },
        resolve: (parent, args): UserData | undefined =>
          data.login(args.email, args.password),
      },
      createUser: {
        type: UserType,
        args: {
          email: { type: GraphQLString },
          phoneNumber: { type: GraphQLString },
          displayName: { type: GraphQLString },
          password: { type: GraphQLString },
        },
        resolve: (parent, args): UserData | null => {
          return data.addUser(args);
        },
      },
      makeStore: {
        type: UserType,
        args: {
          uid: { type: GraphQLString },
          jwt: { type: GraphQLString },
        },
        resolve: (parent, args): UserData | undefined =>
          data.makeUserStore(args.uid, args.jwt),
      },
      trustStore: {
        type: UserType,
        args: {
          uid: { type: GraphQLString },
          jwt: { type: GraphQLString },
        },
        resolve: (parent, args): UserData | undefined =>
          data.trustUser(args.uid, args.jwt),
      },
    },
  }),
});

export default schema;
