$ion_schema_1_0
type::{
  name: ordered_elements_core_types,
  ordered_elements: [int, string, { type: symbol }],
}
$test::{
  type: ordered_elements_core_types,
  should_accept_as_valid: [
    [0, "a", b],
    (1  "b"  c),
    document::(2 "a" b),
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.bool,
    null.list,
    null.sexp,
    [1],
    [1, "a"],
    [1, "a", "b"],
    ["a", "b", c],
    [1, "a", b, null],
    document::( 1 "a" b null ),
  ]
}
