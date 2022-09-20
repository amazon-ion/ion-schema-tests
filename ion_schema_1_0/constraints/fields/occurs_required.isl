$ion_schema_1_0
type::{
  name: fields_occurs_required,
  fields: {
    a: { type: int, occurs: required },
    b: int,
  },
}
$test::{
  type: fields_occurs_required,
  should_accept_as_valid: [
    { a: 1 },
    { a: 1, b: 2 },
    { a: 1, b: 2, c: 3 },
  ],
  should_reject_as_invalid: [
    null,
    null.struct,
    {},
    { b: 2 },
    5,
    [],
    (),
  ]
}
