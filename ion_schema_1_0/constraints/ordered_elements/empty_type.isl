$ion_schema_1_0
type::{
  name: ordered_elements_empty_type,
  ordered_elements: [
    {},                // equivalent to { type: any }
  ],
}
$test::{
  type: ordered_elements_empty_type,
  should_accept_as_valid: [
    [5],
  ],
  should_reject_as_invalid: [
    [null],
  ]
}
