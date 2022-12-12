$ion_schema_2_0

type::{
  name: precision_with_single_value,
  precision: 2,
}

$test::{
  type: precision_with_single_value,
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
    4.20e-1,
  ]
}

type::{
  name: precision_with_range,
  precision: range::[2, 4],
}

$test::{
  type: precision_with_range,
  should_accept_as_valid:[
    42d10,
    42d2,
    42d1,
    42d0,
    4.2,
    0.42,
    0.432,
    0.4321,
  ],
  should_reject_as_invalid:[
    null,
    null.null,
    null.decimal,
    null.symbol,
    0.4,
    0.43210,
    1.2e-1
  ]
}

$test::{
  description: "precision may not be null.int",
  invalid_types: [
    { precision: null.int },
  ]
}
$test::{
  description: "precision must be greater than zero",
  invalid_types: [
    { precision: 0 },
  ]
}
$test::{
  description: "precision range lower bound must be greater than zero",
  invalid_types: [
    { precision: range::[0, 1] },
  ]
}
$test::{
  description: "precision range must be a valid integer range",
  invalid_types:[
    { precision: range::(1 2) },
    { precision: range::[min, max] },
    { precision: range::null.list },
    { precision: range::[1] },
    { precision: range::[1, 2, 3] },
    { precision: range::[1d0, 2] },
    { precision: range::[1, 2d0] },
    { precision: range::[1e0, 2] },
    { precision: range::[1, 2e0] },
  ]
}

$test::{
  description: "precision range must be satisfiable",
  isl_for_isl_can_validate: false,
  invalid_types:[
    { precision: range::[2, 1] },
    { precision: range::[exclusive::1, exclusive::2] },
  ]
}

$test::{
  description: "precision must be an integer or a range",
  invalid_types:[
    { precision: [1, 2] },
    { precision: (1 2) },
    { precision: { min: 1, max: 2} },
    { precision: null },
    { precision: min },
    { precision: max },
    { precision: "foo" },
    { precision: false },
    { precision: 2d0 },
    { precision: 3e0 },
    { precision: {{ "1" }} },
    { precision: {{ aGVsbG8= }} },
  ]
}
