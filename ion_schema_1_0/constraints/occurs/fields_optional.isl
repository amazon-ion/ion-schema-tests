$ion_schema_1_0
type::{
  name: occurs_fields_optional,
  fields: { a: string }
}
$test::{
  type: occurs_fields_optional,
  should_accept_as_valid: [
    { },
    { a: "hi" },
    { other_field: null },
  ],
  should_reject_as_invalid: [
    null,
    null.struct,
    { a: null },
    { a: null.string },
    { a: 5 },
  ]
}
