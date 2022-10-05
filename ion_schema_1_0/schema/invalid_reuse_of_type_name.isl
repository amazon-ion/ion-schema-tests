$ion_schema_1_0
$test::{
  description: "two types in a schema cannot have the same name",
  isl_for_isl_can_validate: false,
  invalid_schemas: [ (

    $ion_schema_1_0
    schema_header::{}
    type::{ name: foo, type: int }
    type::{ name: foo, type: int, valid_values: [1, 2, 3] }
    schema_footer::{}

  ) ]
}
