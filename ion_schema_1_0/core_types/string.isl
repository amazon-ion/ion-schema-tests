$ion_schema_1_0
$test::{
  type: string,
  should_accept_as_valid: [
    "",
    "a",
    "hello",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    a,
  ]
}
