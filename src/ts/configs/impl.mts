import { ICar } from "./int.mjs";

export class Car implements ICar {
  drive(): void {
    console.log("Driving from CarImpl");
  }
}
