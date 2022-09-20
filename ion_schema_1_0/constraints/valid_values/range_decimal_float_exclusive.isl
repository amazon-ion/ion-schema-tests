$ion_schema_1_0
type::{
  name: valid_values_range_decimal_float_exclusive,
  valid_values: range::[0, 100.0],
}
$test::{
  type: valid_values_range_decimal_float_exclusive,
  should_accept_as_valid: [
    0,

    0d0,
    0d1,
    0d-1,

    0e0,
    0e1,
    0e-1,

    100,
    100d0,
    100e0,
  ],
  should_reject_as_invalid: [
    null,
    -1, 101,

    -0.00000000001d0,
    100.00000000001,

    -0.00000000001e0,
    100.00000000001e0,
  ]
}
