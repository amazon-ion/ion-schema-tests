$ion_schema_1_0
type::{
  name: any_of_core_types,
  any_of: [
    bool,
    int,
    string,
  ],
}
$test::{
  type: any_of_core_types,
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
