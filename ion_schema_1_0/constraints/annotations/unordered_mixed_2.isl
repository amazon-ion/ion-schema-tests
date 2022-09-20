$ion_schema_1_0
type::{
  name: annotations_unordered_mixed_2,
  annotations: required::[a, optional::b, c, optional::d],
}
$test::{
  type: annotations_unordered_mixed_2,
  should_accept_as_valid: [
    a::c::5,
    c::a::5,
    b::a::d::c::5,
    open_content::a::open_content::c::open_content::5,
    open_content::a::open_content::b::open_content::c::open_content::d::open_content::5,
  ],
  should_reject_as_invalid: [
    5,
    a::5,
    c::5,
    b::c::d::5,
    a::b::d::5,
  ]
}
