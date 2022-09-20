$ion_schema_1_0
type::{
    name: annotations_closed_ordered_optional,
    annotations: closed::ordered::[a, b, c, d],
}
$test::{
  type: annotations_closed_ordered_optional,
  should_accept_as_valid: [
    5,
    a::5,
    b::5,
    c::5,
    a::b::5,
    a::b::c::5,
    a::d::5,
    b::d::5,
    b::c::d::5,
    a::b::c::d::5,
  ],
  should_reject_as_invalid: [
    a::a::b::5,
    b::b::5,
    d::b::a::5,
    a::b::a::b::a::5,
    a::b::c::d::d::5,
  ]
}
