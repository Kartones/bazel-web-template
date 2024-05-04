import assert from "node:assert";
import { describe, it } from "node:test";
import { A } from "./a.mjs";

describe("Tests for A", () => {
  it("Checks A value", () => {
    assert.strictEqual(A, "A");
  });
});
