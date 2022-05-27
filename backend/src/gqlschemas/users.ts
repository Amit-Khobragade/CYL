import * as data from "../Data/Data";
import { GraphQLObjectType, GraphQLString, GraphQLBoolean } from "graphql";
import { UserData } from "../interfaces";

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

const RootUser = new GraphQLObjectType({
  name: "RootUserType",
  fields: {
    user: {
      type: UserType,
      args: {
        uid: { type: GraphQLString },
      },
      resolve: (parent, args): UserData | undefined =>
        data.getUserById(args.uid),
    },
  },
});
