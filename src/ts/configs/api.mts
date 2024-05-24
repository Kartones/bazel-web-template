import process from "node:process";

import { CarModule } from "./int.mjs";

const USE_MOCK_IMLP = process.env.NODE_ENV === "testing";

const dynamicImport = USE_MOCK_IMLP ? "./mock.mjs" : "./impl.mjs";
// The import must be a string literal to fool TSC, else it will request both paths
// Note that we also lose typing information, so the interface should also define a module, to ease the type casting
const { Car } = (await import(dynamicImport)) as CarModule;

const car = new Car();

car.drive();
