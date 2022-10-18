$ion_schema_1_0
$test::{
  type: $int,
  should_accept_as_valid: [
    12345,
    null.int,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.symbol,
    "hello",
  ]
}
