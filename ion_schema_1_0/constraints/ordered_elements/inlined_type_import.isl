$ion_schema_1_0
type::{
  name: ordered_elements_inlined_type_import,
  ordered_elements: [
    { id: "schema/util/positive_int.isl", type: positive_int },
  ],
}
$test::{
  type: ordered_elements_inlined_type_import,
  should_accept_as_valid: [
    [1],
  ],
  should_reject_as_invalid: [
    [0],
  ]
}
