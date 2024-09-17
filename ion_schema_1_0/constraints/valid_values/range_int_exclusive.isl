$ion_schema_1_0
type::{
  name: valid_values_range_int_exclusive,
  valid_values: range::[exclusive::-100, exclusive::100],
  type: $any,   // overrides default "type: any"
}
$test::{
  type: valid_values_range_int_exclusive,
  should_accept_as_valid: [
    -99, -1, 0, 1, 99,
    -99.999999999999999999999999999d0,
    -99.99999999999999e0,
    99.999999999999999999999999999d0,
    99.99999999999999e0,
  ],
  should_reject_as_invalid: [
    null,
    -100, 100, -101, 101,
    -9223372036854775809,   // Long.MAX_VALUE - 1
    -999999999999999999999,
    9223372036854775808,   // Long.MAX_VALUE + 1
    999999999999999999999,

    -100d0, -100e0,
    100d0, 100e0,
  ]
}
