type::{
    annotations: closed::ordered::required::[a, b, optional::c],
}
valid::[
    a::b::5,
    a::b::c::5,
]
invalid::[
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