$ion_schema_1_0
$test::{
  type: $lob,
  should_accept_as_valid: [
    {{aGVsbG8=}},
    {{"hello"}},
    null.blob,
    null.clob,
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.symbol,
    "hello",
  ]
}
