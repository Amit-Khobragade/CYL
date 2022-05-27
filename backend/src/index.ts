import postRouter from "./post";
import Express from "express";
import { initializeApp } from "firebase-admin/app";
import { credential } from "firebase-admin";

initializeApp({
  credential: credential.cert("src/auth/auth-key.json"),
});

const app = Express();

app.use(Express.json());
app.use(postRouter);

app.listen(3000);
