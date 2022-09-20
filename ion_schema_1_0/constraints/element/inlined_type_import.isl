$ion_schema_1_0
type::{
  name: element_inlined_type_import,
  element: { id: "schema/util/positive_int.isl", type: positive_int },
}
$test::{
  type: element_inlined_type_import,
  should_accept_as_valid: [
    { a: 1 },
  ],
  should_reject_as_invalid: [
    { a: 0 },
  ]
}
