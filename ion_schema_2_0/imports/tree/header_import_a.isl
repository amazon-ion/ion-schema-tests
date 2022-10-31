$ion_schema_2_0

schema_header::{
  imports: [
    { id: "imports/tree/header_import_b.isl" },
    { id: "imports/tree/header_import_c.isl" },
  ]
}

type::{
  name: a_type,
  annotations: { valid_values: [[a]] },
  fields: closed::{
    b: b_type,
    c: c_type,
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
}

schema_footer::{}

$test::{
  description: "no indirectly imported types should be available in this schema's scope",
  invalid_types: [
    { type: d_type, },
    { type: e_type, },
  ]
}
