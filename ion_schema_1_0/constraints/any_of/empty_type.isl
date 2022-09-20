$ion_schema_1_0
type::{
  name: any_of_empty_type,
  any_of: [
    {},       // equivalent to not: { type: any }
  ],
}
$test::{
  type: any_of_empty_type,
  should_accept_as_valid: [
    5,
  ],
  should_reject_as_invalid: [
    null,
  ]
}
