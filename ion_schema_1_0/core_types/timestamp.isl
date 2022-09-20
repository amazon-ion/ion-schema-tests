$ion_schema_1_0
$test::{
  type: timestamp,
  should_accept_as_valid: [
    2018T,
    2018-01-01T,
    2018-01-01T00:00:00.000Z,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.timestamp,
    null.symbol,
    "hello",
  ]
}
