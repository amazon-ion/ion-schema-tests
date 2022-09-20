$ion_schema_1_0
type::{
  name: occurs_fields_required,
  fields: { a: { type: string, occurs: required } }
}
$test::{
  type: occurs_fields_required,
  should_accept_as_valid: [
    { a: "hi" },
  ],
  should_reject_as_invalid: [
    null,
    { },
    { a: null },
    { a: null.string },
    { a: 5 },
    { a: null.int },
  ]
}
