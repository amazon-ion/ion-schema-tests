$ion_schema_1_0
type::{
  name: annotations_ordered_optional,
  annotations: ordered::[a, b, c, d],
}
$test::{
  type: annotations_ordered_optional,
  should_accept_as_valid: [
    5,
    a::5,
    b::5,
    c::5,
    d::5,
    a::b::5,
    a::c::5,
    a::d::5,
    b::d::5,
    c::d::5,
    a::b::c::5,
    a::b::c::d::5,
    open_content::a::open_content::b::open_content::c::open_content::d::open_content::5,

    // optional annotations behave like open content, so the following are all valid:
    b::a::c::d::5,
    a::c::b::d::5,
    a::b::d::c::5,
    d::c::b::a::5,
    open_content::d::open_content::c::open_content::b::open_content::a::open_content::5,
  ],
  should_reject_as_invalid: [
    // anything goes
  ]
}
