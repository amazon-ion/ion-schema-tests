$ion_schema_2_0

type::{
  name: all_of_two_types,
  all_of: [
    number,
    $int,
  ]
}

$test::{
  type: all_of_two_types,
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
  name: all_of_one_type,
  all_of: [
    int,
  ]
}

$test::{
  type: all_of_one_type,
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
  // all_of is a conjunction. An empty conjunction is always true.
  name: all_of_zero_types,
  all_of: []
}

$test::{
  type: all_of_zero_types,
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
  ],
  should_reject_as_invalid: [
    // Nothing
  ],
}

type::{
  name: all_of_with_inline_import,
  all_of: [ { id: 'util.isl', type: positive_int } ],
}

$test::{
  type: all_of_with_inline_import,
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
  name: all_of_with_inline_type,
  all_of: [ { codepoint_length: 5 } ],
}

$test::{
  type: all_of_with_inline_type,
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
  description: "all_of must be a list of type references",
  invalid_types: [
    { all_of: null },
    { all_of: null.int },
    { all_of: 5 },
    { all_of: int },
    { all_of: "$int" },
    { all_of: { container_length: 5 } },
    { all_of: (int float) },
    { all_of: [int, float, ()] },
    { all_of: range::[1, 5] },
  ]
}

$test::{
  description: "all_of type references should exist",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { all_of: [int, float, not_a_real_type] },
  ]
}

$test::{
  description: "all_of must not have a variably occurring type reference",
  invalid_types: [
    { all_of: [{ occurs: 2, type: int }] },
  ],
}

$test::{
  description: "all_of must not have a named type definition",
  invalid_types: [
    { all_of: [{ name: foo, type: int }] },
  ],
}
