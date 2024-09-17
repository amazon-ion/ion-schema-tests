$ion_schema_1_0
type::{
  name: valid_values_range_int_min,
  valid_values: range::[min, 100],
  type: $any,   // overrides default "type: any"
}
$test::{
  type: valid_values_range_int_min,
  should_accept_as_valid: [
    -1, 0, 1, 99, 100,
    -9223372036854775809,   // Long.MAX_VALUE - 1
    -999999999999999999999,

    // floats, decimals
    100d0, 100e0,
  ],
  should_reject_as_invalid: [
    null,
    101,
    9223372036854775808,    // Long.MAX_VALUE + 1
    999999999999999999999,

    100.0000000000000000000000001d0, 100.00000000000001e0,

    // all other ion types
  ]
}
