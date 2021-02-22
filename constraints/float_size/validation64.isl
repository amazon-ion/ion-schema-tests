type::{
    float_size: float64,
    type: $any,
}

test_validation::{
    value: null.decimal,
    violations: [
        { constraint: {   float_size: float64 }, code: invalid_type },
    ],
}


test_validation::{
    value: null.float,
    violations: [
        { constraint: {   float_size: float64 }, code: null_value },
    ],
}


test_validation::{
    values: [1, "a", 10d1, false],
    violations: [
        { constraint: {   float_size: float64 }, code: invalid_type },
    ],
}

