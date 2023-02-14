$ion_schema_2_0

/*
Import dependency graph (higher node imports lower node)
        (A)
       /   \
     (B)   (C)
          /  \
        (D)  (E)
*/
type::{
  name: a_type,
  annotations: { valid_values: [[a]] },
  fields: closed::{
    b: { id: "imports/tree/inline_import_b.isl", type: b_type },
    c: { id: "imports/tree/inline_import_c.isl", type: c_type },
  },
}

$test::{
  type: a_type,
  should_accept_as_valid: [
    a::{
      b: b,
      c: c::{ d: d, e: e }
    },
  ],
  should_reject_as_invalid: [
    a::{ c: {} },
    a::{ c: c },
  ]
}

$test::{
  description: "no imported types should be available in this schema's scope",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { type: b_type, },
    { type: c_type, },
    { type: d_type, },
    { type: e_type, },
  ]
}
