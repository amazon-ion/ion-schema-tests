$ion_schema_2_0

type::{
  name: 'exponent: -2',
  exponent: -2,
}

$test::{
  type: 'exponent: -2',
  should_accept_as_valid:[
    0.42,
    4.2d-1,
    42d-2,
  ],
  should_reject_as_invalid:[
    null,
    null.null,
    null.decimal,
    null.symbol,
    0.4,
    0.432,
    0.42d2,
    0.42d-2,
    0.42e0,
  ]
}

type::{
  name: 'exponent: range::[-4, 2]',
  exponent: range::[-4, 2],
}

$test::{
  type: 'exponent: range::[-4, 2]',
  should_accept_as_valid:[
    42d2,
    42d1,
    42d0,
    4.2,
    0.4,
    0.42,
    0.432,
    0.4321,
  ],
  should_reject_as_invalid:[
    null,
    null.null,
    null.decimal,
    null.symbol,
    42d3,
    0.43210,
    1.2e-1
  ]
}

$test::{
  description: "exponent may not be null.int",
  invalid_types: [
    { exponent: null.int },
  ]
}

$test::{
  description: "exponent range must be a valid integer range",
  invalid_types:[
    { exponent: range::(1 2) },
    { exponent: range::[min, max] },
    { exponent: range::null.list },
    { exponent: range::[1] },
    { exponent: range::[1, 2, 3] },
    { exponent: range::[1d0, 2] },
    { exponent: range::[1, 2d0] },
    { exponent: range::[1e0, 2] },
    { exponent: range::[1, 2e0] },
  ]
}

$test::{
  description: "exponent range must not be non-empty",
  isl_for_isl_can_validate: false,
  invalid_types:[
    { exponent: range::[2, 1] },
    { exponent: range::[exclusive::1, exclusive::2] },
  ]
}

$test::{
  description: "exponent must be an integer or a range",
  invalid_types:[
    { exponent: [1, 2] },
    { exponent: (1 2) },
    { exponent: { min: 1, max: 2} },
    { exponent: null },
    { exponent: min },
    { exponent: max },
    { exponent: "foo" },
    { exponent: false },
    { exponent: 2d0 },
    { exponent: 3e0 },
    { exponent: {{ "1" }} },
    { exponent: {{ aGVsbG8= }} },
  ]
}
