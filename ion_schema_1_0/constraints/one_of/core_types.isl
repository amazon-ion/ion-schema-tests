$ion_schema_1_0
type::{
  name: one_of_core_types,
  one_of: [
    bool,
    int,
    string,
  ],
}
$test::{
  type: one_of_core_types,
  should_accept_as_valid: [
    true,
    5,
    "hi",
  ],
  should_reject_as_invalid: [
    null,
    5.0,
    hi,
  ]
}
