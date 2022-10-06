$ion_schema_1_0

$test::{
  description: "attempting to import an unknown type should result in an error",
  isl_for_isl_can_validate: false,
  invalid_schemas: [ (
    schema_header::{
      imports: [
        { id: "schema/util/positive_int.isl", type: unknown_type }
      ],
    }
    schema_footer::{
    }
  ) ]
}
