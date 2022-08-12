import "dotenv/config";
import express from "express";
import { graphqlHTTP } from "express-graphql";
import orderSchema from "./gqlschemas/orders";
import productSchema from "./gqlschemas/products";
import userSchema from "./gqlschemas/users";

const app = express();

app.use(
  "/users",
  graphqlHTTP({
    schema: userSchema,
    // ! only for development
    graphiql: true,
  })
);

app.use(
  "/products",
  graphqlHTTP({
    schema: productSchema,
    // ! only for development
    graphiql: true,
  })
);

app.use(
  "/orders",
  graphqlHTTP({
    schema: orderSchema,
    // ! only for development
    // graphiql: true,
  })
);

app.listen(3000, () => console.log("connected now"));
