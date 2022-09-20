$ion_schema_1_0
type::{
  name: contains_various_values,
  contains: [true, 1, 2.0, '3', "4", [5], (6), {a: 7} ],
}
$test::{
  type: contains_various_values,
  should_accept_as_valid: [
    [[5], '3', {a: 7}, true, 2.0, "4", (6), 1, extra_value],
    ([5]  '3'  {a: 7}  true  2.0  "4"  (6)  1  extra_value),
    document::([5] '3' {a: 7} true 2.0 "4" (6) 1 extra_value),
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.int,
    null.list,
    null.sexp,
    null.struct,
    [true, 1, 2.0, '3', "4", [5], (6)],
    document::( true 1 2.0 '3' "4" [5] (6) ),
  ]
}
