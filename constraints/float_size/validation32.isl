type::{
    float_size: float32,
    type: $any,
}

test_validation::{
    value: null.decimal,
    violations: [
        { constraint: {   float_size: float32 }, code: invalid_type },
    ],
}


test_validation::{
    value: null.float,
    violations: [
        { constraint: {   float_size: float32 }, code: null_value },
    ],
}


test_validation::{
    values: [1, "a", 10d1, false],
    violations: [
        { constraint: {   float_size: float32 }, code: invalid_type },
    ],
}


test_validation::{
    values: [ 1.7976931348623157E308, 4.9E-324, 3.4028234663852886E39, 1.401298464324817E-46],
    violations: [
        { constraint: {   float_size: float32 }, code: insufficient_float_size },
    ],
}