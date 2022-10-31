$ion_schema_1_0

type::{
  name: ordinary_struct,
  type: struct,
}

$test::{
  description: "Ion Schema 2.0 should be able to import from an Ion Schema 1.0 document",
  valid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/isl_2_0_importing_isl_1_0.isl", type: ordinary_struct }
        ]
      }
      type::{
        name: foo,
        type: ordinary_struct,
      }
      schema_footer::{}
    ),
  ]
}
