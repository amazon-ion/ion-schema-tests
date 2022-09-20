$ion_schema_1_0
type::{
  name: annotations_ordered_mixed,
  annotations: ordered::[a, required::b, c, required::d],
}
$test::{
  type: annotations_ordered_mixed,
  should_accept_as_valid: [
       b::   d::5,
    a::b::   d::5,
       b::c::d::5,
    a::b::c::d::5,
       b::a::d::5,    // 'a' is treated as open content
    c::b::d::5,       // 'c' is treated as open content
    c::b::a::d::5,    // 'a' and 'c' are treated as open content
  ],
  should_reject_as_invalid: [
    b::5,
    d::5,
    d::b::5,
  ]
}
