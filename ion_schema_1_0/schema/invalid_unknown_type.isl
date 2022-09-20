$ion_schema_1_0
$test::{
  description: "type reference that refers to a non-existent type",
  invalid_schema: (

    $ion_schema_1_0
    schema_header::{}
    type::{
      type: unknown_type,
    }
    schema_footer::{}

  )
}
