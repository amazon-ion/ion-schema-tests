$ion_schema_1_0
type::{
    name: annotations_closed_ordered_mixed,
    annotations: closed::ordered::required::[a, b, optional::c],
}
$test::{
  type: annotations_closed_ordered_mixed,
  should_accept_as_valid: [
    a::b::5,
    a::b::c::5,
  ],
  should_reject_as_invalid: [
    5,
    a::5,
    b::5,
    b::a::5,
    a::c::5,
    b::c::5,
    a::b::a::5,
    a::b::c::a::5,
    a::b::d::5,
    a::b::c::d::5,
  ]
}
