import { Router, Request, Response } from "express";
import { getAuth } from "firebase-admin/auth";
import { isNewUserData } from "./interfaces";
import codes from "./codes";

const router = Router();

router.post("/test", (req: Request, res: Response) => {
  res.send("hello");
});

router.post("/create-user", async (req: Request, res: Response) => {
  let data = req.body.usr;

  //! check for the validity of the data
  if (!isNewUserData(data)) {
    codes.BAD_REQUEST.sendResponse(res);
    return;
  }

  // * Find user
  let usr = null;
  try {
    usr = await getAuth().getUserByPhoneNumber(data.phoneNumber);
  } catch (error: any) {
    console.log("User Doesnt Exists/Error: " + error);
  }

  // * Create User
  if (!usr) {
    try {
      usr = await getAuth().createUser(data);
    } catch (error) {
      codes.INTERNAL_SERVER_ERROR.sendResponse(res);
      return;
    }
  }

  if (!usr) {
    codes.INTERNAL_SERVER_ERROR.sendResponse(res);
    return;
  }

  codes.SUCESS.sendResponseWithMessage(res, usr);
});

router.post("");

export default router;
