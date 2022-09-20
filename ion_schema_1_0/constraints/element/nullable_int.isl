$ion_schema_1_0
type::{
  name: element_nullable_int,
  element: nullable::int,
}
$test::{
  type: element_nullable_int,
  should_accept_as_valid: [
    [],
    [1],
    [1, null.int, 3],
    [1, null, 3],
    (),
    (1),
    (1 null.int 3),
    { a: 1, b: null.int, c: null },
    document::(1 null.int),
    document::(1 null),
  ],
  should_reject_as_invalid: [
    null.list,
    [1.],
    [1e0],
    (1 2 3 true 4),
    (null.string),
    { a: 1, b: null.string },
    document::(1.),
    document::(null.symbol),
  ]
}
