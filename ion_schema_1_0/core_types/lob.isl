$ion_schema_1_0
$test::{
  type: lob,
  should_accept_as_valid: [
    {{aGVsbG8=}},
    {{"hello"}},
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.blob,
    null.clob,
    null.symbol,
    "hello",
  ]
}
