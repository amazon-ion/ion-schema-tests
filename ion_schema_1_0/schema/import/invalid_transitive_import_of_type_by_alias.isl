$ion_schema_1_0
$test::{
  description: "type imports must not be resolved transitively through another schema",
  invalid_schema: (

    // type 'positive_int_1' should not be recognized in this schema:
    $ion_schema_1_0
    schema_header::{
      imports: [
        { id: "schema/import/import_type_by_alias.isl" },
      ],
    }
    type::{
      name: attempted_transitive_import_of_type_by_alias,
      type: positive_int_1,
    }
    schema_footer::{}

  )
}

