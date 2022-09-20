$ion_schema_1_0
type::{
    name: annotations_closed,
    annotations: closed::[a, b, c, d],
}
$test::{
  type: annotations_closed,
  should_accept_as_valid: [
    5,
    a::5,
    b::5,
    c::5,
    d::5,
    a::a::a::5,
    a::b::c::d::5,
    b::a::d::c::5,
    d::c::b::a::5,
    d::d::c::c::b::b::a::a::5,
  ],
  should_reject_as_invalid: [
    open_content::a::open_content::b::open_content::c::open_content::d::open_content::5,
    e::5,
    abcd::5,
    a::b::c::d::e::5,
  ],
}
