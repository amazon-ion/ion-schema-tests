$ion_schema_1_0
schema_header::{
  imports: [
    { id: "schema/import/abcde.isl" },
  ],
}
type::{
  name: import_test,
  ordered_elements: [ a, b, c, d, e ],
}
schema_footer::{}

$test::{
  type: import_test,
  should_accept_as_valid: [
    [a, "b", c, "d", e],
    ("a" b "c" d "e"),
    document::(a b c d e),
  ],
  should_reject_as_invalid: [
    [a, b, c, d],
    [a, b, c, d, e, f],
  ]
}
$test::{
  type: a,
  should_accept_as_valid: [a, "a"],
  should_reject_as_invalid: [   "b", c, "d", e],
}
$test::{
  type: b,
  should_accept_as_valid: [b, "b"],
  should_reject_as_invalid: [a,      c, "d", e],
}
$test::{
  type: c,
  should_accept_as_valid: [c, "c"],
  should_reject_as_invalid: [a, "b",    "d", e],
}
$test::{
  type: d,
  should_accept_as_valid: [d, "d"],
  should_reject_as_invalid: [a, "b", c,      e],
}
$test::{
  type: e,
  should_accept_as_valid: [e, "e"],
  should_reject_as_invalid: [a, "b", c, "d",  ],
}
