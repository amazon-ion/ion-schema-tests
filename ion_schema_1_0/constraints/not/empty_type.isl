$ion_schema_1_0
type::{
  name: not_empty_type,
  not: {},     // equivalent to not: { type: any }
  type: $any,  // override the default "type: any" constraint, otherwise any null value will be invalid
}
$test::{
  type: not_empty_type,
  should_accept_as_valid: [
    null,
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
  ],
  should_reject_as_invalid: [
    true,
    5,
    5e0,
    5d0,
    2019-01-01T,
    symbol,
    "string",
    {{ "clob" }},
    {{aGVsbG8=}},
    [],
    (),
    {},
  ]
}
