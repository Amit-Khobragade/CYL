import { Response } from "express";

class errorCodes {
  code: number;
  message: string;

  constructor(code: number, message: string) {
    this.code = code;
    this.message = message;
  }

  sendResponse(res: Response): void {
    res.status(this.code).send(this.message);
  }

  sendResponseWithMessage(res: Response, message: any): void {
    res.status(this.code).send(this.message);
  }
}
const codes = {
  INTERNAL_SERVER_ERROR: new errorCodes(500, "internal server error"),
  BAD_REQUEST: new errorCodes(400, "bad request"),
  SUCESS: new errorCodes(200, "sucess"),
};

export default codes;
