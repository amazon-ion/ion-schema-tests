$ion_schema_1_0
$test::{
  type: $symbol,
  should_accept_as_valid: [
    hello,
    null.symbol,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.int,
    "hello",
  ]
}
