$ion_schema_1_0
type::{
  name: element_int,
  element: int,
}
$test::{
  type: element_int,
  should_accept_as_valid: [
    [],
    [1],
    [1, 2, 3],
    (),
    (1),
    (1 2 3),
    { a: 1, b: 2, c: 3 },
    document::(1 2 3),
  ],
  should_reject_as_invalid: [
    null.list,
    [1.],
    [1e0],
    [1, 2, null.int],
    (1 2 3 true 4),
    { a: 1, b: 2, c: true },
    { a: 1, b: 2, c: null.int },
    document::(1.),
    document::(1 2 null.int),
    document::(1 2 true),
  ]
}
