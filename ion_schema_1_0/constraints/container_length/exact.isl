$ion_schema_1_0
type::{
  name: container_length_exact,
  container_length: 3,
}
$test::{
  type: container_length_exact,
  should_accept_as_valid: [
    [1, 2, 3],
    (a a a),
    (null null null),
    { a: 1, b: 2, c: 3 },
    document::([] () {}),
  ],
  should_reject_as_invalid: [
    null,
    null.bool,
    null.null,
    null.list,
    null.sexp,
    null.struct,
    [1, 2],
    [1, 2, 3, 4],
    (a a),
    (a a a a),
    { a: 1, b: 2 },
    { a: 1, b: 2, c: 3, d: 4 },
    document::([] ()),
    document::([] () {} null),
  ]
}
