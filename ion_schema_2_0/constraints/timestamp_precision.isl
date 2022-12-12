$ion_schema_2_0

type::{
  name: timestamp_precision_with_single_value,
  timestamp_precision: month,
}

$test::{
  type: timestamp_precision_with_single_value,
  should_accept_as_valid:[
    2022-01T,
    1999-12T,
    foo::0123-12T,
  ],
  should_reject_as_invalid:[
    null,
    null.timestamp,
    2022T,
    2022-03-04T,
    2022-03-04T05:06:07Z,
  ]
}

type::{
  name: timestamp_precision_with_range,
  timestamp_precision: range::[day, second],
}

$test::{
  type: timestamp_precision_with_range,
  should_accept_as_valid:[
    2022-03-04T05:06:07Z,
    2022-03-04T05:06:07-00:00,
    2022-03-04T05:06:07+12:30,
    2022-03-04T05:06Z,
    2022-03-04T,
  ],
  should_reject_as_invalid:[
    2022-03-04T05:06:07.0Z,
    2022-03-04T05:06:07.00Z,
    2022-03-04T05:06:07.000Z,
    2022-03T,
    2022T,
  ]
}

type::{
  name: timestamp_precision_with_range_exclusively_between_two_consecutive_named_precisions,
  timestamp_precision: range::[exclusive::second, exclusive::millisecond],
}

$test::{
  type: timestamp_precision_with_range_exclusively_between_two_consecutive_named_precisions,
  should_accept_as_valid:[
    2022-03-04T05:06:07.0Z,
    2022-03-04T05:06:07.00Z,
  ],
  should_reject_as_invalid:[
    2022T,
    2022-03T,
    2022-03-04T,
    2022-03-04T05:06Z,
    2022-03-04T05:06:07Z,
    2022-03-04T05:06:07.000Z,
    2022-03-04T05:06:07.0000Z,
    2022-03-04T05:06:07.00000Z,
    2022-03-04T05:06:07.000000Z,
    2022-03-04T05:06:07.0000000Z,
    2022-03-04T05:06:07.00000000Z,
    2022-03-04T05:06:07.000000000Z,
  ]
}

type::{
  name: timestamp_precision_with_range_exclusively_greater_than_nanosecond,
  timestamp_precision: range::[exclusive::nanosecond, max],
}

$test::{
  type: timestamp_precision_with_range_exclusively_greater_than_nanosecond,
  should_accept_as_valid:[
    2022-03-04T05:06:07.0000000000Z,
    2022-03-04T05:06:07.00000000000Z,
  ],
  should_reject_as_invalid:[
    2022T,
    2022-03T,
    2022-03-04T,
    2022-03-04T05:06Z,
    2022-03-04T05:06:07Z,
    2022-03-04T05:06:07.0Z,
    2022-03-04T05:06:07.00Z,
    2022-03-04T05:06:07.000Z,
    2022-03-04T05:06:07.0000Z,
    2022-03-04T05:06:07.00000Z,
    2022-03-04T05:06:07.000000Z,
    2022-03-04T05:06:07.0000000Z,
    2022-03-04T05:06:07.00000000Z,
    2022-03-04T05:06:07.000000000Z,
  ]
}

$test::{
  description: "timestamp_precision range must be a valid timestamp precision range",
  invalid_types:[
    { timestamp_precision: range::(year day) },
    { timestamp_precision: range::[min, max] },
    { timestamp_precision: range::null.list },
    { timestamp_precision: range::[minute, -6] },
    { timestamp_precision: range::[year, month, day] },
  ]
}

$test::{
  description: "timestamp_precision range must be satisfiable",
  isl_for_isl_can_validate: false,
  invalid_types:[
    { timestamp_precision: range::[exclusive::minute, exclusive::second] },
    { timestamp_precision: range::[second, exclusive::second] },
  ]
}

$test::{
  description: "timestamp_precision range lower bound must not be greater than upper bound",
  invalid_types: [
    { timestamp_precision: range::[month, year] },
    { timestamp_precision: range::[day, month] },
    { timestamp_precision: range::[minute, day] },
    { timestamp_precision: range::[second, minute] },
    { timestamp_precision: range::[millisecond, second] },
    { timestamp_precision: range::[microsecond, millisecond] },
    { timestamp_precision: range::[nanosecond, microsecond] },
  ]
}

$test::{
  description: "timestamp_precision must be an timestamp precision value or a range",
  invalid_types:[
    { timestamp_precision: [1, 2] },
    { timestamp_precision: (1 2) },
    { timestamp_precision: { min: 1, max: 2} },
    { timestamp_precision: null },
    { timestamp_precision: null.symbol },
    { timestamp_precision: min },
    { timestamp_precision: max },
    { timestamp_precision: "year" },
    { timestamp_precision: hour },
    { timestamp_precision: false },
    { timestamp_precision: 2d0 },
    { timestamp_precision: 3e0 },
    { timestamp_precision: 2 },
    { timestamp_precision: -9 },
    { timestamp_precision: {{ "1" }} },
    { timestamp_precision: {{ aGVsbG8= }} },
    { timestamp_precision: [year, month, day] },
  ]
}
