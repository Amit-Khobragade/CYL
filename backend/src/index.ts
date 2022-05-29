import "dotenv/config";
import express from "express";
import { graphqlHTTP } from "express-graphql";
import schema from "./gqlschemas/users";

const app = express();

app.use(
  "/users",
  graphqlHTTP({
    schema: schema,
    // ! only for development
    graphiql: true,
  })
);

app.listen(3000, () => console.log("connected now"));
