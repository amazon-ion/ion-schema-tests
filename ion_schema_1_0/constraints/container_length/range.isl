$ion_schema_1_0
type::{
  name: container_length_range,
  container_length: range::[1, 3],
}
$test::{
  type: container_length_range,
  should_accept_as_valid: [
    [1],
    [1, 2],
    [1, 2, 3],
    (a),
    (a b),
    (a b c),
    { a: 1 },
    { a: 1, b: 2 },
    { a: 1, b: 2, c: 3 },
    document::(1),
    document::(1 2),
    document::(1 2 3),
  ],
  should_reject_as_invalid: [
    null,
    null.bool,
    null.null,
    null.list,
    null.sexp,
    null.struct,
    [],
    [1, 2, 3, 4],
    (),
    (1 2 3 4),
    {},
    { a: 1, b: 2, c: 3, d: 4 },
    document::(),
    document::(1 2 3 4),
  ]
}
