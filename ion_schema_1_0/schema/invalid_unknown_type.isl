$ion_schema_1_0
$test::{
  description: "type reference that refers to a non-existent type",
  isl_for_isl_can_validate: false,
  invalid_schemas: [ (

    $ion_schema_1_0
    schema_header::{}
    type::{
      type: unknown_type,
    }
    schema_footer::{}

  ) ]
}
