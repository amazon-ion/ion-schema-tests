$ion_schema_1_0
$test::{
  type: symbol,
  should_accept_as_valid: [
    hello,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.symbol,
    null.int,
    "hello",
  ]
}
