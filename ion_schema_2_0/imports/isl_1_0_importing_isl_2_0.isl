$ion_schema_2_0

type::{
  name: ordinary_struct,
  type: struct,
}

type::{
  // This is using features not available in Ion Schema 1.0
  name: snake_case_annotated,
  annotations: { element: { regex: "^[a-z0-9_]+$"} },
}

$test::{
  description: "Ion Schema 1.0 should be able to import from an Ion Schema 2.0 document",
  valid_schemas:[
    (
      $ion_schema_1_0
      schema_header::{
        imports: [
          { id: "imports/isl_1_0_importing_isl_2_0.isl", type: ordinary_struct }
        ]
      }
      type::{
        name: foo,
        type: ordinary_struct,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_1_0
      schema_header::{
        imports: [
          { id: "imports/isl_1_0_importing_isl_2_0.isl", type: snake_case_annotated }
        ]
      }
      type::{
        name: foo,
        type: snake_case_annotated,
      }
      schema_footer::{}
    )
  ]
}
