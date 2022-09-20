$ion_schema_1_0

$test::{
  description: "attempting to import an unknown type should result in an error",
  invalid_schema: (
    schema_header::{
      imports: [
        { id: "schema/util/positive_int.isl", type: unknown_type }
      ],
    }
    schema_footer::{
    }
  )
}
