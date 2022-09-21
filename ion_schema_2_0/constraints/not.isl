$ion_schema_2_0

type::{
  name: 'not: any',
  not: any,
}

$test::{
  type: 'not: any',
  should_accept_as_valid: [
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
  should_reject_as_invalid: [
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
}

type::{
  name: not_inline_type,
  not: { codepoint_length: 5 }
}

$test::{
  type: not_inline_type,
  should_accept_as_valid: [
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
  should_reject_as_invalid: [
    abcde,
    "fghij",
  ],
}

type::{
  name: not_inline_import,
  not: { id: 'util.isl', type: positive_int }
}

$test::{
  type: not_inline_import,
  should_accept_as_valid: [
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
  should_reject_as_invalid: [
    1,
    10,
    100,
    1000,
  ],
}

$test::{
  description: "not must be a type reference",
  invalid_types: [
    { not: null },
    { not: null.int },
    { not: 5 },
    { not: "$int" },
    { not: (int float) },
    { not: [int, float] },
    { not: range::[1, 5] },
  ]
}

$test::{
  description: "not must not be a variably occurring type reference",
  invalid_types: [
    { not: { occurs: 2, type: int } },
  ],
}

$test::{
  description: "not must not be a named type definition",
  invalid_types: [
    { not: { name: foo, type: int } },
  ],
}
