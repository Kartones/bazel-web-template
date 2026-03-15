import process from "node:process";

import { CarModule } from "./int.mjs";

const USE_MOCK_IMPL = process.env.NODE_ENV === "testing";

// The import must be a string literal to fool TSC, else it will request both paths
const dynamicImport = USE_MOCK_IMPL ? "./mock.mjs" : "./impl.mjs";

// Note that we also lose typing information, so the interface should also define a module, to ease the type casting.
// CarModule cast is unverified at compile time.
try {
  const { Car } = (await import(dynamicImport)) as CarModule;
  if (typeof Car !== "function") {
    throw new Error(`Expected Car to be a constructor, got ${typeof Car}`);
  }
  const car = new Car();
  car.drive();
} catch (err) {
  console.error("Failed to load car module:", err);
  process.exit(1);
}
