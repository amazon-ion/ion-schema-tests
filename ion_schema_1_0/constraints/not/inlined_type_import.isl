$ion_schema_1_0
type::{
  name: not_inlined_type_import,
  not: { id: "schema/util/positive_int.isl", type: positive_int }
}
$test::{
  type: not_inlined_type_import,
  should_accept_as_valid: [
    0,
  ],
  should_reject_as_invalid: [
    1,
  ]
}
