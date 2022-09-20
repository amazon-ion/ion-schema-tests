$ion_schema_1_0
$test::{
  type: bool,
  should_accept_as_valid: [
    false,
    true,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.bool,
    null.symbol,
    "hello",
  ]
}
