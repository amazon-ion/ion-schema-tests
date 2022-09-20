$ion_schema_1_0
type::{
    name: annotations_closed_ordered_required_2,
    annotations: closed::required::ordered::[a, b, a, b],
}
$test::{
  type: annotations_closed_ordered_required_2,
  should_accept_as_valid: [
    a::b::a::b::5,
  ],
  should_reject_as_invalid: [
    5,
    a::5,
    a::b::5,
    a::b::a::5,
    a::b::a::b::a::5,
  ]
}
