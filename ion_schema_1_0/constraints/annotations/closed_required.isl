type::{
    annotations: closed::required::[a, b, c],
}
valid::[
    a::b::c::5,
    a::c::b::5,
    b::c::a::5,
    c::a::b::5,
    a::a::b::c::5,
    a::b::c::c::b::a::5,
]
invalid::[
    5,
    a::5,
    a::b::5,
    a::b::c::d::5,
]
