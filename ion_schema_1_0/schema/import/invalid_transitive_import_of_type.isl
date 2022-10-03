$ion_schema_1_0
$test::{
  description: "type imports must not be resolved transitively through another schema",
  isl_for_isl_can_validate: false,
  invalid_schema: (

    // type 'positive_int' should not be recognized in this schema:
    $ion_schema_1_0
    schema_header::{
      imports: [
        { id: "schema/import/import_type.isl" },
      ],
    }
    type::{
      name: attempted_transitive_import_of_type,
      type: positive_int,
    }
    schema_footer::{}

  )
}
