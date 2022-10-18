$ion_schema_1_0
$test::{
  type: $bool,
  should_accept_as_valid: [
    false,
    true,
    null.bool,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.symbol,
    "hello",
  ]
}
