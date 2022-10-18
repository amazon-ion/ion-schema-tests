$ion_schema_1_0
type::{
  name: not_$string,
  not: $string,
  type: $any,   // overrides default "type: any"
}
$test::{
  type: not_$string,
  should_accept_as_valid: [
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
    null.struct,
    null.symbol,
    null.timestamp,
  ],
  should_reject_as_invalid: [
    "hello",
    null.string,
  ]
}
