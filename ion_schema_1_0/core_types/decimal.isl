$ion_schema_1_0
$test::{
  type: decimal,
  should_accept_as_valid: [
    12.345,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.decimal,
    null.symbol,
    "hello",
  ]
}
