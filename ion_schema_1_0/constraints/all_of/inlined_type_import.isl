$ion_schema_1_0

type::{
  name: all_of_inlined_type_import,
  all_of: [
    { id: "schema/util/positive_int.isl", type: positive_int }
  ],
}
$test::{
  type: all_of_inlined_type_import,
  should_accept_as_valid: [
    1
  ],
  should_reject_as_invalid: [
    0
  ]
}
