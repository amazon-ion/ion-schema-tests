$ion_schema_1_0
$test::{
  type: any,
  should_accept_as_valid: [
    {{aGVsbG8=}},
    false,
    {{"hello"}},
    12.345,
    12e3,
    12345,
    "hello",
    hello,
    2018-01-01T,
    [],
    (),
    {},
  ],
  should_reject_as_invalid: [
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
type::{
  name: default_type
  // default type is 'any'
}
$test::{
  type: default_type,
  should_accept_as_valid: [
    {{aGVsbG8=}},
    false,
    {{"hello"}},
    12.345,
    12e3,
    12345,
    "hello",
    hello,
    2018-01-01T,
    [],
    (),
    {},
  ],
  should_reject_as_invalid: [
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
