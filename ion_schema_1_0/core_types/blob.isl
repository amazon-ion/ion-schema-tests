$ion_schema_1_0
$test::{
  type: blob,
  should_accept_as_valid: [
    {{aGVsbG8=}},
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.blob,
    null.symbol,
    "hello",
  ]
}
