import * as data from "../mongoose/actions/userActions";
import {
  GraphQLObjectType,
  GraphQLString,
  GraphQLBoolean,
  GraphQLSchema,
  GraphQLList,
  GraphQLID,
} from "graphql";

/**
 * * Basic contents of a user includes
 *    * _id
 *    * email
 *    * phoneNumber
 *    * displayName
 *    * is the user a store(isStore)
 *    * is the user trusted(isTrusted)
 *    * jwt : to be implemented
 */
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

/**
 * * User queries:
 *    * user: returns a user by id
 *    * checkJwt: check whether the jwt exists
 *    * //! users: enable only for development
 */
const query = new GraphQLObjectType({
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
    // Todo:  DEVELOPER END POINT MUST BE REMOVED BEFORE PRODUCTION
    // users: {
    //   type: new GraphQLList(UserType),
    //   args: {
    //     password: { type: GraphQLString },
    //   },
    //   resolve: (parent, args) => data.getAllUsers(args.password),
    // },
  },
});

/**
 * * mutation queries
 *    * userLogin: takes the user name and password from the user and //TODO creates and returns jwt
 *    * createUser: Creates and returns a new user
 *    * makeStore: enables the said user to create products
 *    * trustStore: trusts the user (only works when the user is a store)
 */
const mutation = new GraphQLObjectType({
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
});

const userSchema: GraphQLSchema = new GraphQLSchema({ query, mutation });

export default userSchema;
