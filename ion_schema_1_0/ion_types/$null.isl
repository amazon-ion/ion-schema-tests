$ion_schema_1_0
$test::{
  type: $null,
  should_accept_as_valid: [
    null,
    null.null,
  ],
  should_reject_as_invalid: [
    null.blob,
    null.bool,
    null.clob,
    null.decimal,
    null.float,
    null.int,
    null.list,
    null.sexp,
    null.string,
    null.struct,
    null.symbol,
    null.timestamp,
    "hello",
  ]
}
