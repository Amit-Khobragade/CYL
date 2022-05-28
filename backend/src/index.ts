import express from "express";
import { graphqlHTTP } from "express-graphql";
import schema from "./gqlschemas/users";

const app = express();

app.use(
  "/graphql",
  graphqlHTTP({
    schema: schema,
    graphiql: true,
  })
);

app.listen(3000, () => console.log("connected now"));
