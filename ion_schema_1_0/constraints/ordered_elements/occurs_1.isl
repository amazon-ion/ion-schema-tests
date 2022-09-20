$ion_schema_1_0
type::{
  name: ordered_elements_occurs_1,
  ordered_elements: [
    { type: int, occurs: 2 },
    { type: string, occurs: range::[0, 3] },
    { type: symbol, occurs: range::[0, max] },
  ],
}
$test::{
  type: ordered_elements_occurs_1,
  should_accept_as_valid: [
    (1 2),
    (1 2 "a"),
    (1 2 "a" "b" w x),
    (1 2 "a" "b" "c" w),
    (1 2 "a" "b" "c" w x y z),
    (1 2 w),
    (1 2 w x y z),
    document::(1 2 w x y z),
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.bool,
    null.list,
    null.sexp,
    (1),
    (1 "a" w),
    (1 2 "a" "b" "c" "d"),
    document::( 1 2 "a" "b" "c" "d" ),
  ]
}
