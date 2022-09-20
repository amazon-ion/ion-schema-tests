$ion_schema_1_0
type::{
  name: fields_inlined_type_import,
  fields: {
    a: { id: "schema/util/positive_int.isl", type: positive_int }
  },
}
$test::{
  type: fields_inlined_type_import,
  should_accept_as_valid: [
    { a: 1 },
  ],
  should_reject_as_invalid: [
    { a: 0 },
  ]
}
