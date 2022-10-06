$ion_schema_1_0
$test::{
  description: "valid_values must be a list or range",
  invalid_types: [
    { valid_values: null },
    { valid_values: null.int },
    { valid_values: null.list },
    { valid_values: 5 },
    { valid_values: () },
    { valid_values: {} },
  ]
}

$test::{
  description: "valid_values may not be annotated",
  invalid_types: [
    { valid_values: [ hello::5 ] }
  ]
}

$test::{
  description: "valid_values ranges must be valid number or timestamp ranges",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { valid_values: range::[ 1, 0 ] },
    { valid_values: range::[ 0.00000000001, 0 ] },
  ]
}

$test::{
  description: "valid_values ranges must not have both min and max",
  invalid_types: [
    { valid_values: range::[ min, max ] },
    { valid_values: [range::[ min, max ]] },
  ]
}
