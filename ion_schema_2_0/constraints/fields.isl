$ion_schema_2_0

type::{
  name: two_optional_fields,
  fields: { a: bool, b: { occurs: optional, type: int } },
}

$test::{
  type: two_optional_fields,
  should_accept_as_valid: [
    {},
    foo::{},
    { a: true },
    { a: false },
    { a: true, b: 1 },
    { b: 1, c: "foo" },
    { b: 1 },
    { c: 1.23, d: [] }
  ],
  should_reject_as_invalid: [
    null.struct,
    [],
    (),
    { a: 1 },
    { a: null.bool },
    { a: true, a: true },
    { a: true, a: false },
    { b: 1, b: 2 },
    { b: 1.23 },
    { a: true, b: "Hello" },
    { a: "World!", b: 1 },
  ],
}

type::{
  name: one_required_one_optional_fields,
  fields: { c: { occurs: required, type: int }, d: symbol },
}

$test::{
  type: one_required_one_optional_fields,
  should_accept_as_valid: [
    { c: 1 },
    { c: 2, a: true },
    { c: 1, d: maybe },
    { b: 1, c: 2 },
  ],
  should_reject_as_invalid: [
    null.struct,
    {},
    { c: 1, c: 2 },
    { c: 1, c: 2, d: foo },
    { c: 1, d: foo, d: bar },
    { c: 1, d: null },
    { c: null, d: foo },
    { d: hello },
  ],
}

type::{
  name: two_optional_closed_fields,
  fields: closed::{
    q: string,
    a: float,
  },
}

$test::{
  type: two_optional_closed_fields,
  should_accept_as_valid: [
    {},
    { q: "How much do I love Ion Schema?", a: +inf },
    { q: "What is the airspeed of an unladen swallow?", a: mph::12.5e0 },
    { a: nan },
    { q: "Lorem ipsum..." }
  ],
  should_reject_as_invalid: [
    null.struct,
    { a: 1, b: 1 },
    { Q: "foo" },
    { q: "foo", b: 1 },
    { q: "foo", a: 1d0 },
    { q: "foo", q: "bar" },
  ],
}

type::{
  name: field_occurs_n_times,
  fields: {
    a: { occurs: 3, type: int },
  },
}

$test::{
  type: field_occurs_n_times,
  should_accept_as_valid: [
    { a: 1, a: 2, a: 3 },
    { a: 1, a: 2, a: 3, b: true },
  ],
  should_reject_as_invalid: [
    null.struct,
    {},
    { a: 1 },
    { a: 1, a: 2 },
    { a: 1, a: 2, a: 3.0 },
    { a: 1, a: 2, a: 3, a: 4 },
    { a: 1, a: 2, a: 3, a: 4, a: 5 },
    { a: 1, a: 2, a: 3, a: 4, a: 5, a: 6 },
  ],
}

type::{
  name: field_occurs_range,
  fields: closed::{
    a: { occurs: range::[1, 5], type: int },
  },
}

$test::{
  type: field_occurs_range,
  should_accept_as_valid: [
    { a: 1 },
    { a: 1, a: 2 },
    { a: 1, a: 2, a: 3 },
    { a: 1, a: 2, a: 3, a: 4 },
    { a: 1, a: 2, a: 3, a: 4, a: 5 },
  ],
  should_reject_as_invalid: [
    null.struct,
    {},
    { a: true },
    { b: true },
    { a: 1, a: 2, a: 3, a: 4, a: 5, a: 6 },
  ],
}

type::{
  name: field_is_nothing,
  fields: { a: nothing },
}

$test::{
  type: field_is_nothing,
  should_accept_as_valid: [
    {},
    { b: 1 }
  ],
  should_reject_as_invalid: [
    null.struct,
    { a: true },
  ],
}

$test::{
  description: "fields must be a non-null struct",
  invalid_types: [
    { fields: null },
    { fields: null.struct },
    { fields: range::[1, 5] },
    { fields: [foo, bar] },
    { fields: (x + y) },
    { fields: foo },
    { fields: "bar" },
    { fields: 1 },
    { fields: false },
  ]
}

$test::{
  description: "a field must have a type reference",
  invalid_types: [
    { fields: { a: null } },
    { fields: { a: null.int } },
    { fields: { a: 5 } },
    { fields: { a: [int, string] } },
    { fields: { a: "$int" } },
  ]
}

$test::{
  description: "fields must define at least one field name",
  invalid_types: [
    { fields: {} },
  ],
}

$test::{
  description: "fields occurs cannot be 0",
  invalid_types: [
    { fields: { a: { occurs: 0 } } },
  ],
}

$test::{
  description: "fields must not define a field twice",
  invalid_types:[
    { fields: { a: int, a: bool } },
    { fields: { a: int, a: int } },
  ]
}

$test::{
  description: "fields struct must not have unknown annotations",
  invalid_types: [
    { fields: foo::{ a: any } },
  ],
}

$test::{
  description: "field must not be a named type definition",
  invalid_types: [
    { fields: { a: { name: foo, type: int } } },
  ],
}
