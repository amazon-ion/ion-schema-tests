$ion_schema_1_0
type::{
  name: type_inlined_type_import,
  type: { id: "schema/util/positive_int.isl", type: positive_int },
}
$test::{
  type: type_inlined_type_import,
  should_accept_as_valid: [
    1
  ],
  should_reject_as_invalid: [
    0,
  ]
}
