import * as data from "../mongoose/userActions"; //"../Data/userData";
import {
  GraphQLObjectType,
  GraphQLString,
  GraphQLBoolean,
  GraphQLSchema,
  GraphQLList,
  GraphQLID,
} from "graphql";

const UserType = new GraphQLObjectType({
  name: "users",
  fields: () => ({
    _id: { type: GraphQLID },
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
          _id: { type: GraphQLID },
        },
        resolve: (parent, args) => data.getUserById(args._id),
      },
      checkJwt: {
        type: GraphQLBoolean,
        args: {
          _id: { type: GraphQLString },
          jwt: { type: GraphQLString },
        },
        resolve: (parent, args): Boolean => data.checkJwt(args._id, args.jwt),
      },
      //! DEVELOPER END POINT MUST BE REMOVED BEFORE PRODUCTION
      users: {
        type: new GraphQLList(UserType),
        args: {
          password: { type: GraphQLString },
        },
        resolve: (parent, args) => data.getAllUsers(args.password),
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
        resolve: (parent, args) => data.login(args.email, args.password),
      },
      createUser: {
        type: UserType,
        args: {
          email: { type: GraphQLString },
          phoneNumber: { type: GraphQLString },
          displayName: { type: GraphQLString },
          password: { type: GraphQLString },
        },
        resolve: (parent, args) => data.addUser(args),
      },
      makeStore: {
        type: UserType,
        args: {
          _id: { type: GraphQLString },
          jwt: { type: GraphQLString },
        },
        resolve: (parent, args) => data.makeUserStore(args._id, args.jwt),
      },
      trustStore: {
        type: UserType,
        args: {
          _id: { type: GraphQLString },
          jwt: { type: GraphQLString },
        },
        resolve: (parent, args) => data.trustUser(args._id, args.jwt),
      },
    },
  }),
});

export default schema;
