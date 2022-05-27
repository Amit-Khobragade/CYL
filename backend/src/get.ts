import { Router, Request, Response } from "express";
import { getAuth } from "firebase-admin/auth";
const router: Router = Router();

router.get("/auth", (req: Request, res: Response) => {
  // getAuth().getUser()
  res.status(200).json({
    uid: "guyg",
    email: "ggy@ryvh.com",
  });
});

export default router;
