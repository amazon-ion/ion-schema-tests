$ion_schema_1_0
$test::{
  type: $clob,
  should_accept_as_valid: [
    {{""}},
    {{"hello"}},
    null.clob,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.symbol,
    "hello",
  ]
}
