$ion_schema_2_0

type::{
  name: 'container_length: 5',
  container_length: 5,
}

$test::{
  type: 'container_length: 5',
  should_accept_as_valid: [
    [1, 2, 3, 4, 5],
    (a b c d e),
    { a: 1, b: 2, c: 3, d: 4, e: 5 },
    { a: 1, a: 1, a: 1, b: 2, b: 2 },
    document::(a b c d e)
  ],
  should_reject_as_invalid: [
    null.list,
    null.sexp,
    null.struct,
    [1, 2, 3, 4],
    [1, 2, 3, 4, 5, 6],
    (a b c d),
    (a b c d e f),
    { a: 1, b: 2, c: 3, d: 4 },
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6 },
    document::(a b c d),
    document::(a b c d e f),
  ]
}

type::{
  name: 'container_length: range::[5, 10]',
  container_length: range::[5, 10],
}

$test::{
  type: 'container_length: range::[5, 10]',
  should_accept_as_valid:[
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 0],
    (a b c d e),
    (a b c d e f g h i j),
    document::(a b c d e),
    document::(a b c d e f g h i j),
    { a: 1, b: 2, c: 3, d: 4, e: 5 },
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9, j: 10 },
  ],
  should_reject_as_invalid:[
    null.list,
    null.sexp,
    null.struct,
    [1, 2, 3, 4],
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
    (a b c d),
    (a b c d e f g h i j k),
    { a: 1, b: 2, c: 3, d: 4 },
    { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9, j: 10, k: 11 },
    document::(a b c d),
    document::(a b c d e f g h i j k),
  ],
}

$test::{
  description: "container_length may not be null.int",
  invalid_types: [
    { container_length: null.int },
  ]
}
$test::{
  description: "container_length must be greater than or equal to zero",
  invalid_types: [
    { container_length: -1 },
  ]
}
$test::{
  description: "container_length range lower bound must be greater than or equal to zero",
  invalid_types: [
    { container_length: range::[-1, 1] },
  ]
}
$test::{
  description: "container_length range must be a valid integer range",
  invalid_types:[
    { container_length: range::(1 2) },
    { container_length: range::[min, max] },
    { container_length: range::null.list },
    { container_length: range::[2, 1] },
    { container_length: range::[1] },
    { container_length: range::[1, 2, 3] },
    { container_length: range::[1d0, 2] },
    { container_length: range::[1, 2d0] },
    { container_length: range::[1e0, 2] },
    { container_length: range::[1, 2e0] },
    { container_length: range::[exclusive::1, exclusive::2] },
  ]
}
$test::{
  description: "container_length must be an integer or a range",
  invalid_types:[
    { container_length: [1, 2] },
    { container_length: (1 2) },
    { container_length: { min: 1, max: 2} },
    { container_length: null },
    { container_length: min },
    { container_length: max },
    { container_length: "foo" },
    { container_length: false },
    { container_length: 2d0 },
    { container_length: 3e0 },
    { container_length: {{ "1" }} },
    { container_length: {{ aGVsbG8= }} },
    ]
}
