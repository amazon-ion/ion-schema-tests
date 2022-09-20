$ion_schema_1_0
type::{
  name: ordered_elements_occurs_4,
  ordered_elements:[
    { type: int, occurs: optional },
    { type: number, occurs: optional },
    { type: any, occurs: required}
  ]
}
$test::{
  type: ordered_elements_occurs_4,
  should_accept_as_valid:[
    [1],
    [1, 2],
    [1, 2, 3],
    [1, 2.0],
    [1, foo],
    [1.0, foo],
    [1, 1.0, foo],
  ],
  should_reject_as_invalid: [
    [1, 2, 3, 4],
    [1, foo, foo],
  ]
}
