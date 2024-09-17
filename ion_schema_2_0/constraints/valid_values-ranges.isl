$ion_schema_2_0

type::{
  name: valid_values_range_int_decimal,
  valid_values: range::[0, 100.0],
}
$test::{
  type: valid_values_range_int_decimal,
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
    -1,
    101,
    -0.00000000001d0,
    100.00000000001,
    -0.00000000001e0,
    100.00000000001e0,
  ]
}

type::{
  name: valid_values_range_decimal_float_exclusive,
  valid_values: range::[exclusive::0d0, exclusive::2e0],
}
$test::{
  type: valid_values_range_decimal_float_exclusive,
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

type::{
  name: valid_values_range_int,
  valid_values: range::[-100, 100],
}
$test::{
  type: valid_values_range_int,
  should_accept_as_valid: [
    -100,
    -99,
    -1,
    0,
    1,
    99,
    100
  ],
  should_reject_as_invalid: [
    null,
    -101,
    101,
    -9223372036854775809,   // Long.MAX_VALUE - 1
    -999999999999999999999,
    9223372036854775808,   // Long.MAX_VALUE + 1
    999999999999999999999,
  ]
}


type::{
  name: valid_values_range_int_exclusive,
  valid_values: range::[exclusive::-100, exclusive::100],
}
$test::{
  type: valid_values_range_int_exclusive,
  should_accept_as_valid: [
    -99,
    -1,
    0,
    1,
    99,
    -99.999999999999999999999999999d0,
    -99.99999999999999e0,
    99.999999999999999999999999999d0,
    99.99999999999999e0,
  ],
  should_reject_as_invalid: [
    null,
    -100,
    100,
    -101,
    101,
    -9223372036854775809,   // Long.MAX_VALUE - 1
    -999999999999999999999,
    9223372036854775808,   // Long.MAX_VALUE + 1
    999999999999999999999,
    -100d0,
    -100e0,
    100d0,
    100e0,
  ]
}


type::{
  name: valid_values_range_int_max,
  valid_values: range::[-100, max],
}
$test::{
  type: valid_values_range_int_max,
  should_accept_as_valid: [
    -100,
    -99,
    0,
    1,
    9223372036854775808,    // Long.MAX_VALUE + 1
    999999999999999999999,
    // floats, decimals
    -100d0,
    -100e0,
  ],
  should_reject_as_invalid: [
    null,
    -101,
    -9223372036854775809,   // Long.MAX_VALUE - 1
    -999999999999999999999,
    -100.0000000000000000000000001d0,
    -100.00000000000001e0,
  ]
}

type::{
  name: valid_values_range_int_min,
  valid_values: range::[min, 100],
}
$test::{
  type: valid_values_range_int_min,
  should_accept_as_valid: [
    -1,
    0,
    1,
    99,
    100,
    -9223372036854775809,   // Long.MAX_VALUE - 1
    -999999999999999999999,
    // floats, decimals
    100d0,
    100e0,
  ],
  should_reject_as_invalid: [
    null,
    101,
    9223372036854775808,    // Long.MAX_VALUE + 1
    999999999999999999999,
    100.0000000000000000000000001d0,
    100.00000000000001e0,
  ]
}

type::{
  name: valid_values_range_timestamp,
  valid_values: range::[2000-01-01T00:00Z, 2001-01-01T00:00Z],
}
$test::{
  type: valid_values_range_timestamp,
  should_accept_as_valid: [
    2000-01-01T00:00Z,
    2000-01-01T00:00:00.00000000000000000000Z,
    2000-01-01T00:00:00.00000000000000000001Z,
    1999-12-31T23:00-01:00,

    2000-12-31T23:59:59.99999999999999999999Z,
    2001-01-01T00:00:00.00000000000000000000Z,
    2001-01-01T00:00Z,
    2001-01-01T01:00+01:00,
    // unknown local offsets:
    2000T,
    2000-01-01T,
    2001-01-01T,
    2001T,
    2000-06-06T01:00-00:00,
  ],
  should_reject_as_invalid: [
    1999-12-31T23:59:59.99999999999999999999Z,
    2001-01-01T00:00:00.00000000000000000001Z,
  ]
}

type::{
  name: valid_values_range_timestamp_known_offset,
  valid_values: range::[2000-01-01T00:00:00Z, 2020-01-01T00:00:00Z],
}
$test::{
  type: valid_values_range_timestamp_known_offset,
  should_accept_as_valid: [
    2000T,
    2000-01T,
    2000-01-01T,
    2000-01-01T00:00Z,
    2000-01-01T00:00:00Z,
    2000-01-01T00:00:00.000Z,
    2000-01-01T00:00:00.000000000Z,
    2020T,
    2020-01T,
    2020-01-01T,
    2020-01-01T00:00Z,
    2020-01-01T00:00:00Z,
    2020-01-01T00:00:00.000Z,
    2020-01-01T00:00:00.000000000Z,
    1999-12-31T23:00-01:00,
    2020-01-01T01:00+01:00,
  ],
  should_reject_as_invalid: [
    1999T,
    1999-12T,
    1999-12-31T,
    1999-12-31T23:59Z,
    1999-12-31T23:59:59Z,
    1999-12-31T23:59:59.999999999Z,
    2020-01-01T00:00:00.000000001Z,
    2020-01-01T00:00:01Z,
    2020-01-01T00:01Z,
  ]
}

type::{
  name: valid_values_range_timestamp_unknown_offset,
  valid_values: range::[2000T, 2020T],
}
$test::{
  type: valid_values_range_timestamp_unknown_offset,
  should_accept_as_valid: [
    2000T,
    2000-01T,
    2000-01-01T,
    2000-01-01T00:00Z,
    2000-01-01T00:00:00Z,
    2000-01-01T00:00:00.000Z,
    2000-01-01T00:00:00.000000000Z,
    2020T,
    2020-01T,
    2020-01-01T,
    2020-01-01T00:00Z,
    2020-01-01T00:00:00Z,
    2020-01-01T00:00:00.000Z,
    2020-01-01T00:00:00.000000000Z,
    1999-12-31T23:00-01:00,
    2020-01-01T01:00+01:00,
  ],
  should_reject_as_invalid: [
    1999T,
    1999-12T,
    1999-12-31T,
    1999-12-31T23:59Z,
    1999-12-31T23:59:59Z,
    1999-12-31T23:59:59.999999999Z,
    2020-01-01T00:00:00.000000001Z,
    2020-01-01T00:00:01Z,
    2020-01-01T00:01Z,
  ]
}

type::{
  name: valid_values_range_timestamp_mixed_offset,
  valid_values: range::[2000T, 2020-01-01T00:00:00.000Z],
}
$test::{
  type: valid_values_range_timestamp_mixed_offset,
  should_accept_as_valid: [
    2000T,
    2000-01T,
    2000-01-01T,
    2000-01-01T00:00Z,
    2000-01-01T00:00:00Z,
    2000-01-01T00:00:00.000Z,
    2000-01-01T00:00:00.000000000Z,
    2020T,
    2020-01T,
    2020-01-01T,
    2020-01-01T00:00Z,
    2020-01-01T00:00:00Z,
    2020-01-01T00:00:00.000Z,
    2020-01-01T00:00:00.000000000Z,
    1999-12-31T23:00-01:00,
    2020-01-01T01:00+01:00,
  ],
  should_reject_as_invalid: [
    1999T,
    1999-12T,
    1999-12-31T,
    1999-12-31T23:59Z,
    1999-12-31T23:59:59Z,
    1999-12-31T23:59:59.999999999Z,
    2020-01-01T00:00:00.000000001Z,
    2020-01-01T00:00:01Z,
    2020-01-01T00:01Z,
  ]
}

type::{
  name: valid_values_range_timestamp_exclusive,
  valid_values: range::[exclusive::2000-01-01T00:00Z, exclusive::2001-01-01T00:00Z],
}
$test::{
  type: valid_values_range_timestamp_exclusive,
  should_accept_as_valid: [
    2000-01-01T00:00:00.00000000000000000001Z,
    2000-12-31T23:59:59.99999999999999999999Z,
  ],
  should_reject_as_invalid: [
    2000-01-01T00:00Z,
    2000-01-01T00:00:00.00000000000000000000Z,
    1999-12-31T23:00-01:00,

    2001-01-01T00:00Z,
    2001-01-01T00:00:00.00000000000000000000Z,
    2001-01-01T01:00+01:00,
  ]
}

type::{
  name: valid_values_range_timestamp_max,
  valid_values: range::[2000-01-01T00:00Z, max],
}
$test::{
  type: valid_values_range_timestamp_max,
  should_accept_as_valid: [
    2000-01-01T00:00Z,
    9999-12-31T23:59Z,
  ],
  should_reject_as_invalid: [
    1999-12-31T23:59:59.99999999999999999999Z,
  ]
}

type::{
  name: valid_values_range_timestamp_min,
  valid_values: range::[min, 2000-01-01T00:00Z],
}
$test::{
  type: valid_values_range_timestamp_min,
  should_accept_as_valid: [
    0001-01-01T00:00Z,
    2000-01-01T00:00Z,
  ],
  should_reject_as_invalid: [
    2000-01-01T00:00:00.00000000000000000001Z,
  ]
}

$test::{
  description: "valid_values ranges must be valid number or timestamp ranges",
  invalid_types: [
    { valid_values: range::[ min, max ] },
    { valid_values: range::[ 1, exclusive::max ] },
    { valid_values: range::[ exclusive::min, 100 ] },
    { valid_values: range::[ 2000T, 3000.0] },
  ]
}

$test::{
  description: "valid_values ranges must be satisfiable",
  isl_for_isl_can_validate: false,
  invalid_types:[
    { valid_values: range::[ 1, 0 ] },
    { valid_values: range::[ 0.00000000001, 0 ] },
    { valid_values: range::[ exclusive::1, exclusive::1 ] },
  ]
}
