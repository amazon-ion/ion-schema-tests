$ion_schema_1_0
$test::{
  type: number,
  should_accept_as_valid: [
    12.345,
    12e3,
    12345,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.decimal,
    null.float,
    null.int,
    null.symbol,
    "hello",
  ]
}
