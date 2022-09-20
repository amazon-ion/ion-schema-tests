$ion_schema_1_0
$test::{
  description: "importing two different schemas with conflicting type names should result in an error",
  invalid_schema: (

    $ion_schema_1_0
    schema_header::{
      imports: [
        { id: "schema/util/positive_int.isl" },
        { id: "schema/util/duplicate_positive_int.isl" },
      ],
    }
    schema_footer::{}

  )
}
