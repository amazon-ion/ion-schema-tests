$ion_schema_1_0
$test::{
  description: "importing a type with the same name as a type in the schema should result in an error",
  invalid_schema: (

    $ion_schema_1_0
    schema_header::{
      imports: [
        { id: "schema/util/positive_int.isl", type: positive_int },
      ],
    }
    type::{
      name: positive_int,
    }
    schema_footer::{}

  )
}
