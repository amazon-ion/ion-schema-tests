$ion_schema_2_0

type::{
  name: any_of_three_types,
  any_of: [
    decimal,
    float,
    $int,
  ]
}

$test::{
  type: any_of_three_types,
  should_accept_as_valid: [
    1,
    2,
    3,
    null.int,
    1e0,
    2e0,
    1d0,
    2e0,
  ],
  should_reject_as_invalid: [
    null.float,
    null.decimal,
    {},
    null,
    "Hello",
    foo,
    [1, 2, 3],
    (x + y),
    2022T,
  ],
}

type::{
  name: any_of_one_type,
  any_of: [
    int,
  ]
}

$test::{
  type: any_of_one_type,
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
  // any_of is a disjunction. An empty disjunction is always false.
  name: any_of_zero_types,
  any_of: []
}

$test::{
  type: any_of_zero_types,
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
  name: any_of_with_inline_import,
  any_of: [ { id: 'util.isl', type: positive_int } ],
}

$test::{
  type: any_of_with_inline_import,
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
  name: any_of_with_inline_type,
  any_of: [ { codepoint_length: 5 } ],
}

$test::{
  type: any_of_with_inline_type,
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
  description: "any_of must be a list of type references",
  invalid_types: [
    { any_of: null },
    { any_of: null.int },
    { any_of: 5 },
    { any_of: int },
    { any_of: "$int" },
    { any_of: { container_length: 5 } },
    { any_of: (int float) },
    { any_of: [int, float, not_a_real_type] },
    { any_of: [int, float, ()] },
    { any_of: range::[1, 5] },
  ]
}

$test::{
  description: "any_of must not have a variably occurring type reference",
  invalid_types: [
    { any_of: [{ occurs: 2, type: int }] },
  ],
}

$test::{
  description: "any_of must not have a named type definition",
  invalid_types: [
    { any_of: [{ name: foo, type: int }] },
  ],
}
