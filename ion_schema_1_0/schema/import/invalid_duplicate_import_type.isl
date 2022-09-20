$ion_schema_1_0
$test::{
  description: "importing two different types with the same name should result in an error",
  invalid_schema: (

    $ion_schema_1_0
    schema_header::{
      imports: [
        { id: "schema/util/positive_int.isl", type: positive_int },
        { id: "schema/util/duplicate_positive_int.isl", type: positive_int  },
      ],
    }
    schema_footer::{}

  )
}
