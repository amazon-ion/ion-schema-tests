$ion_schema_1_0
type::{
  name: valid_values_range_int_decimal,
  valid_values: range::[exclusive::0d0, exclusive::2e0],
}
$test::{
  type: valid_values_range_int_decimal,
  should_accept_as_valid: [
    1,

    0.00000000001d0,
    1.99999999999d0,

    0.00000000001e0,
    1.99999999999e0,
  ],
  should_reject_as_invalid: [
    null,
    0,
    2,

    0d0,
    2d0,

    0e0,
    2e0,
  ]
}
