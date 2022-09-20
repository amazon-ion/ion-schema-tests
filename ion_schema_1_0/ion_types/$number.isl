$ion_schema_1_0
$test::{
  type: $number,
  should_accept_as_valid: [
    12.345,
    12e3,
    12345,
    null.decimal,
    null.float,
    null.int,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.symbol,
    "hello",
  ]
}
