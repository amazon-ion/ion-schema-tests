type::{
    annotations: closed::ordered::[a, b, c, d],
}
valid::[
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
]
invalid::[
    a::a::b::5,
    b::b::5,
    d::b::a::5,
    a::b::a::b::a::5,
    a::b::c::d::d::5,
]
