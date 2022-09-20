$ion_schema_1_0
type::{
  name: fields_empty_type,
  fields: {
    a: {},   // equivalent to { type: any }
  },
}
$test::{
  type: fields_empty_type,
  should_accept_as_valid: [
    { a: 5 },
  ],
  should_reject_as_invalid: [
    { a: null },
  ]
}
