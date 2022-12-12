$ion_schema_2_0

type::{
  name: type_named_type,
  type: any,
}

$test::{
  type: type_named_type,
  should_accept_as_valid: [
    true,
    1,
    2d0,
    3e0,
    "Hello",
    foo,
    {{ "abc" }},
    {{ aGVsbG8= }},
    2022T,
    [1, 2, 3],
    (x + y),
    {},
  ],
  should_reject_as_invalid: [
    null,
    null.bool,
    null.int,
    null.float,
    null.decimal,
    null.string,
    null.symbol,
    null.blob,
    null.clob,
    null.timestamp,
    null.list,
    null.sexp,
    null.struct,
  ],
}

type::{
  name: type_inline_type,
  type: { codepoint_length: 5 }
}

$test::{
  type: type_inline_type,
  should_accept_as_valid: [
    abcde,
    "fghij",
  ],
  should_reject_as_invalid: [
    true,
    1,
    2d0,
    3e0,
    "Hello World!",
    foo,
    {{ "abc" }},
    {{ aGVsbG8= }},
    2022T,
    [1, 2, 3],
    (x + y),
    {},
    null,
    null.bool,
    null.int,
    null.float,
    null.decimal,
    null.string,
    null.symbol,
    null.blob,
    null.clob,
    null.timestamp,
    null.list,
    null.sexp,
    null.struct,
  ],
}

type::{
  name: type_inline_import,
  type: { id: 'util.isl', type: positive_int }
}

$test::{
  type: type_inline_import,
  should_accept_as_valid: [
    1,
    10,
    100,
    1000,
  ],
  should_reject_as_invalid: [
    true,
    0,
    1d0,
    2e0,
    "Hello",
    foo,
    {{ "abc" }},
    {{ aGVsbG8= }},
    2022T,
    [1, 2, 3],
    (x + y),
    {},
    null,
    null.bool,
    null.int,
    null.float,
    null.decimal,
    null.string,
    null.symbol,
    null.blob,
    null.clob,
    null.timestamp,
    null.list,
    null.sexp,
    null.struct,
  ],
}

$test::{
  description: "type must be a type reference",
  invalid_types: [
    { type: null },
    { type: null.int },
    { type: 5 },
    { type: "$int" },
    { type: (int float) },
    { type: [int, float] },
    { type: range::[1, 5] },
  ]
}

$test::{
  description: "type must not be a variably occurring type reference",
  invalid_types: [
    { type: { occurs: 2, type: int } },
  ],
}

$test::{
  description: "type must not be a named type definition",
  invalid_types: [
    { type: { name: foo, type: int } },
  ],
}
