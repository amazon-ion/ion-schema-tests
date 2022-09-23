$ion_schema_2_0

type::{
  name: field_names_with_inline_type,
  field_names: { codepoint_length: range::[1,8] },
}

$test::{
  type: field_names_with_inline_type,
  should_accept_as_valid: [
    {},
    { foo: 1, bar: 2 },
    { hello: 1, world: 2 },
    { hello: 1, hello: 2 },
  ],
  should_reject_as_invalid: [
    null,
    null.struct,
    (),
    [1, 2.0],
    1,
    2d0,
    3d0,
    "hello",
    world,
    { '': 1 },
    { a: 1, b: 2, cccccccccccc: 3 },
    { very_long_field_name: 4 },
  ],
}

type::{
  name: field_names_distinct,
  field_names: distinct::symbol,
}

$test::{
  type: field_names_distinct,
  should_accept_as_valid: [
    {},
    { a: 1 },
    { a: 1, b: 2 },
    { a: 1, b: 2, c: 3 },
  ],
  should_reject_as_invalid: [
    null.struct,
    { a: 1, a: 1 },
    { a: 1, a: 2 },
    { a: 1, b: 2, c: 3, a: 4 },
  ],
}

type::{
  name: snake_case,
  regex: "^[a-z0-9_]*$",
}

type::{
  name: field_names_with_type_reference,
  field_names: snake_case,
}

$test::{
  type: field_names_with_type_reference,
  should_accept_as_valid: [
    {},
    { a: 1, b: 2 },
    { hello: WORLD },
    { hello_world: 1, hello_world: 2  },
    { abc_123_def: 1, _foo_bar_baz: 2 },
  ],
  should_reject_as_invalid: [
    null.struct,
    { A: 1 },
    { _A: 1, _B: 2 },
  ],
}

type::{
  name: 'field_names: nothing',
  field_names: nothing,
}

$test::{
  type: 'field_names: nothing',
  should_accept_as_valid: [
    {},
  ],
  should_reject_as_invalid: [
    null,
    null.struct,
    { a: 1 },
  ],
}

$test::{
  description: "field_names must be a type reference",
  invalid_types: [
    { field_names: null },
    { field_names: null.int },
    { field_names: 5 },
    { field_names: [int, string] },
    { field_names: "$int" },
  ]
}

$test::{
  description: "field_names must not be a variably occurring type reference",
  invalid_types: [
    { field_names: { occurs: 2, type: int } },
  ],
}

$test::{
  description: "field_names must not be a named type definition",
  invalid_types: [
    { field_names: { name: foo, type: int } },
  ],
}

$test::{
  description: "field_names type reference may not have unknown annotations",
  invalid_types: [
    { field_names: foo::int },
    { field_names: distinct::foo::string },
  ]
}
