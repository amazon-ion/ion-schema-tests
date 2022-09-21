$ion_schema_2_0

type::{
  name: one_of_three_types,
  one_of: [
    { annotations: required::[foo] },
    { valid_values: range::[0, 10] },
    $int,
  ]
}

$test::{
  type: one_of_three_types,
  should_accept_as_valid: [
    -1,
    2e0,
    3d0,
    null.int,
    foo::{ a: 1, b: 2 }
  ],
  should_reject_as_invalid: [
    // Doesn't match any types
    null.float,
    null.decimal,
    {},
    null,
    "Hello",
    foo,
    [1, 2, 3],
    (x + y),
    2022T,
    // Matches 2 types
    foo::null.int,
    foo::1d0,
    foo::2e0,
    0,
    10,
    // Matches 3 types
    foo::0,
    foo::10
  ],
}

type::{
  name: one_of_one_type,
  one_of: [
    int,
  ]
}

$test::{
  type: one_of_one_type,
  should_accept_as_valid: [
    1,
    2,
    3,
  ],
  should_reject_as_invalid: [
    null.int,
    1e0,
    1d0,
  ],
}

type::{
  // one_of is a disjunction. An empty disjunction is always false.
  name: one_of_zero_types,
  one_of: []
}

$test::{
  type: one_of_zero_types,
  should_accept_as_valid: [
    // Nothing
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
    foo::bar::baz,
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
  ]
}

type::{
  name: one_of_with_inline_import,
  one_of: [ { id: 'util.isl', type: positive_int } ],
}

$test::{
  type: one_of_with_inline_import,
  should_accept_as_valid: [
    1,
    2,
    3,
  ],
  should_reject_as_invalid: [
    null.int,
    -1,
    0,
    1.0,
  ],
}


type::{
  name: one_of_with_inline_type,
  one_of: [ { codepoint_length: 5 } ],
}

$test::{
  type: one_of_with_inline_type,
  should_accept_as_valid: [
    "Hello", World
  ],
  should_reject_as_invalid: [
    null.string,
    null.symbol,
    "Greetings", Earthling,
    "Hi", Dude,
  ],
}

$test::{
  description: "one_of must be a list of type references",
  invalid_types: [
    { one_of: null },
    { one_of: null.int },
    { one_of: 5 },
    { one_of: int },
    { one_of: "$int" },
    { one_of: { container_length: 5 } },
    { one_of: (int float) },
    { one_of: [int, float, not_a_real_type] },
    { one_of: [int, float, ()] },
    { one_of: range::[1, 5] },
  ]
}

$test::{
  description: "one_of must not have a variably occurring type reference",
  invalid_types: [
    { one_of: [{ occurs: 2, type: int }] },
  ],
}

$test::{
  description: "one_of must not have a named type definition",
  invalid_types: [
    { one_of: [{ name: foo, type: int }] },
  ],
}
