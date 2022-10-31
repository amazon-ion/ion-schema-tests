$ion_schema_2_0

type::{
  // Intentionally bad definition of "positive_int" to make sure that the
  // inline imports correctly use the imported definition, not this one.
  name: positive_int,
  type: nothing,
}

type::{
  name: small_positive_int,
  type: { id: "util.isl", type: positive_int },
  valid_values: range::[min, 9],
}

$test::{
  // Ensure that the inlined type import correctly validates data
  type: small_positive_int,
  should_accept_as_valid:[
    1,
    9,
  ],
  should_reject_as_invalid: [
    0,
    5.0,
    5e0,
    10,
  ]
}

$test::{
  description: "Inlined type imports should not cause name conflicts",
  valid_schemas:[
    (
      $ion_schema_2_0
      type::{
        name: positive_int,
        type: { id: "util.isl", type: positive_int },
      }
    )
  ]
}


type::{
  // Inline imports may be annotated with `$null_or`
  name: null_or_positive_int,
  type: $null_or::{ id: "util.isl", type: positive_int }
}

$test::{
  type: null_or_positive_int,
  should_accept_as_valid: [
    null,
    1,
    2,
  ],
  should_reject_as_invalid: [
    null.int,
    0,
    1.0,
  ]
}

type::{
  // Inline imports may be annotated with other annotations if the constraint allows it
  name: distinct_positive_ints,
  element: distinct::{ id: "util.isl", type: positive_int }
}

$test::{
  type: distinct_positive_ints,
  should_accept_as_valid: [
    [],
    [1, 2, 3],
  ],
  should_reject_as_invalid: [
    [0, 1],
    [1, 1],
  ]
}
