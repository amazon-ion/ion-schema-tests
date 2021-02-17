type::{
    float_size: float32,
    type: float,
    valid_values: range::[-3.4028234663852886E38, 3.4028234663852886E38]
}

test_validation::{
    value: null.decimal,
    violations: [
        { constraint: { float_size: float32 }, code: invalid_type },
        {constraint:{type:float},code:type_mismatch},
        { constraint: { valid_values: range::[-3.4028234663852886E38, 3.4028234663852886E38] }, code: invalid_value },
    ],
}


test_validation::{
    value: null.float,
    violations: [
        { constraint: { float_size: float32 }, code: null_value },
        { constraint: { type: float }, code: null_value },
        { constraint: { valid_values: range::[-3.4028234663852886E38, 3.4028234663852886E38] }, code: invalid_value },
    ],
}


test_validation::{
     values: [+inf, -inf, nan],
     violations: [
         {constraint: { valid_values: range::[-3.4028234663852886E38,3.4028234663852886E38]} ,code:invalid_value }
     ],
}

test_validation::{
    value: 1.7976931348623157E308,
    violations: [
        {constraint: { float_size: float32}, code: insufficient_float_size },
        {constraint: { valid_values: range::[-3.4028234663852886E38,3.4028234663852886E38]} ,code:invalid_value }
    ],
}