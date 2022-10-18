$ion_schema_1_0
$test::{
  type: $string,
  should_accept_as_valid: [
    "",
    "a",
    "hello",
    null.string,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.symbol,
    a,
  ]
}
