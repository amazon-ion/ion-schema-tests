$ion_schema_1_0
type::{
  name: ordered_elements_occurs_3,
  ordered_elements: [
    { type: int, occurs: optional },
    int,
    symbol,
  ],
}
$test::{
  type: ordered_elements_occurs_3,
  should_accept_as_valid: [
    [1, a],
    [1, 2, a],
  ],
  should_reject_as_invalid: [
    [1],
    [a],
    [1, 2, 3, a],
  ]
}
