$ion_schema_1_0
$test::{
  description: "two types in a schema cannot have the same name",
  invalid_schema: (

    $ion_schema_1_0
    schema_header::{}
    type::{ name: foo, type: int }
    type::{ name: foo, type: int, valid_values: [1, 2, 3] }
    schema_footer::{}

  )
}
