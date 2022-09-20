$ion_schema_1_0
type::{
  name: fields_occurs_range,
  fields: {
    c: { occurs: range::[2, 4] },
  },
}
$test::{
  type: fields_occurs_range,
  should_accept_as_valid: [
    { c: 1, c: a },
    { c: a, c: 2.0, c: "c" },
    { c: 1e0, c: 2d0, c: c, c: true },
  ],
  should_reject_as_invalid: [
    { c: 1 },
    { c: 1, c: 2, c: 3, c: 4, c: 5 },
    { a: 1, b: 2 },
    { a: 1, b: 2, c: 3 },
    { a: 1, b: 2, c: 3, d: 4 },
  ]
}
