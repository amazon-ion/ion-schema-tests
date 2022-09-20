$ion_schema_1_0
type::{
  name: annotations_unordered_required,
  annotations: required::[a, b, c, d],
}
$test::{
  type: annotations_unordered_required,
  should_accept_as_valid: [
    a::b::c::d::5,
    b::a::d::c::5,
    d::c::b::a::5,
    open_content::a::open_content::b::open_content::c::open_content::d::open_content::5,
  ],
  should_reject_as_invalid: [
    b::c::d::5,
    a::c::d::5,
    a::b::d::5,
    a::b::c::5,
  ]
}
