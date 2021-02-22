type::{
    float_size: float64,
}
valid::[
    1.0e0,
    0.1e0,
    0.2e0,
    3.4028234663852886E39,
    3.402823466385288999E38,
    1.401298464324817E-46,
    1.7976931348623157E308,
    4.9E-324,
    +inf,
    -inf,
    nan
]

// out of range values turn into infinities.
invalid::[
    1,
    12.34,
    12.34d3,
    null,
    null.float,
    hi,
    "a",
    true,
]