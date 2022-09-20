$ion_schema_1_0
type::{
  name: valid_values_range_int,
  valid_values: range::[-100, 100],
  type: $any,   // overrides default "type: any"
}
$test::{
  type: valid_values_range_int,
  should_accept_as_valid: [
    -100, -99, -1, 0, 1, 99, 100
  ],
  should_reject_as_invalid: [
    null,
    -101, 101,
    -9223372036854775809,   // Long.MAX_VALUE - 1
    -9999999999999999999999999999999999999999999999999999999999999999999999999999,
    9223372036854775808,   // Long.MAX_VALUE + 1
    9999999999999999999999999999999999999999999999999999999999999999999999999999,
  ]
}
