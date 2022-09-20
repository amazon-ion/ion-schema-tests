$ion_schema_1_0
$test::{
  type: struct,
  should_accept_as_valid: [
    {},
    {a: 1, b: 2, c: 3},
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.struct,
    null.symbol,
    "hello",
  ]
}
