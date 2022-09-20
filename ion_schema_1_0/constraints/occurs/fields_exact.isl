$ion_schema_1_0
type::{
  name: occurs_fields_exact,
  fields: { a: { type: string, occurs: 3 } }
}
$test::{
  type: occurs_fields_exact,
  should_accept_as_valid: [
    { a: "1", a: "2", a: "3" },
  ],
  should_reject_as_invalid: [
    null,
    { },
    { a: null, a: null, a: null },
    { a: null.int, a: null.int, a: null.int },
    { a: null.string, a: null.string, a: null.string },
    { a: "1", a: "2" },
    { a: "1", a: "2", a: "3", a: "4" },
  ]
}
