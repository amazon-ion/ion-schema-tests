$ion_schema_2_0

// The purpose of this test is to ensure that implementations can properly load self-referencing/recursive types
// There are a few value-based test cases just to make sure that the implementation doesn't fail when you
// actually try to use the type.

type::{
  name: sexpression_tree,
  ordered_elements: [
    symbol,
    {
      type: sexpression_tree,
      occurs: range::[0, max],
    },
  ]
}

$test::{
  type: sexpression_tree,
  should_accept_as_valid: [
    (a),
    (a (b)),
    (a (b) (c) (d)),
    (a (b (c (d)))),
  ],
  should_reject_as_invalid: [
    (),
    (a b),
    (a (b c)),
    (a ()),
  ],
}
