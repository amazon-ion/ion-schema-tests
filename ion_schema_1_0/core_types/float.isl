$ion_schema_1_0
$test::{
  type: float,
  should_accept_as_valid: [
    12e3,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.float,
    null.symbol,
    "hello",
  ]
}
