// Could simply use node assertions, but using chai for demonstration of a dependency
// import assert from "node:assert";
import { assert } from "chai";
import { describe, it } from "node:test";
import { sumNumbers } from "./c.mjs";

describe("Tests for C", () => {
  it("Sums positive numbers", () => {
    assert.strictEqual(sumNumbers(1, 2), 3);
  });
});
