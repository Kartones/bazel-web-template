import assert from "assert";
import { describe, it } from "node:test";
import { sumNumbers } from "./c.mjs";

describe("Tests for C", () => {
  it("Sums positive numbers", () => {
    assert.strictEqual(sumNumbers(1, 2), 3);
  });
});
