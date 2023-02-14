$ion_schema_2_0

/*
Import dependency graph (higher node imports lower node)
        (A)
       /   \
     (B)   (C)
       \   /
        (D)
*/
schema_header::{
  imports: [
    { id: "imports/diamond/header_import_b.isl" },
    { id: "imports/diamond/header_import_c.isl" },
  ]
}

type::{
  name: a_type,
  one_of: [
    b_type,
    c_type,
  ]
}

$test::{
  type: a_type,
  should_accept_as_valid: [
    d::b,
    d::c,
  ],
  should_reject_as_invalid: [
    b,
    c,
    d::a,
    a::c,
  ]
}

schema_footer::{}

$test::{
  description: "no indirectly imported types should be available in this schema's scope",
  isl_for_isl_can_validate: false,
  invalid_types: [
    { type: d_type, },
  ]
}

$test::{
  description: "it should still be possible to directly import a type that is transitively imported",
  valid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/diamond/header_import_b.isl" },
          { id: "imports/diamond/header_import_c.isl" },
          { id: "imports/diamond/header_import_d.isl" },
        ]
      }
      type::{
        name: bcd,
        ordered_elements: [
          b_type,
          c_type,
          d_type,
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/diamond/header_import_b.isl" },
          { id: "imports/diamond/header_import_c.isl" },
        ]
      }
      type::{
        name: bcd,
        ordered_elements: [
          b_type,
          c_type,
          { id: "imports/diamond/header_import_d.isl", type: d_type },
        ]
      }
      schema_footer::{}
    )
  ]
}
