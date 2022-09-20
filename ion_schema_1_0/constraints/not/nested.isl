$ion_schema_1_0
type::{
  name: not_nested,
  not: { not: { not: { not: string } } }
}
$test::{
  type: not_nested,
  should_accept_as_valid: [
    "abc",
  ],
  should_reject_as_invalid: [
    {{aGVsbG8=}},
    false,
    {{"hello"}},
    12.345,
    12e3,
    12345,
    hello,
    2018-01-01T,
    [],
    (),
    {},
    null,
    null.null,
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
  ]
}
