$ion_schema_1_0
$test::{
  description: "importing a type with the same name as a type in the schema should result in an error",
  isl_for_isl_can_validate: false,
  invalid_schemas: [ (

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

  ) ]
}
