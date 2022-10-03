$ion_schema_1_0
$test::{
  description: "schema imports must not be resolved transitively through another schema",
  isl_for_isl_can_validate: false,
  invalid_schema: (

    // types 'a', 'b', 'c', 'd', and 'e' should not be recognized in this schema:
    $ion_schema_1_0
    schema_header::{
      imports: [
        { id: "schema/import/import.isl" },
      ],
    }
    type::{
      name: attempted_transitive_import_of_schema,
      ordered_elements: [a, b, c, d, e],
    }
    schema_footer::{}

  )
}
