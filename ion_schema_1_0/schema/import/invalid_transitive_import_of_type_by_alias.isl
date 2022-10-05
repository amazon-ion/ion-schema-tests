$ion_schema_1_0
$test::{
  description: "aliased type imports must not be importable by another schema",
  isl_for_isl_can_validate: false,
  invalid_schemas: [ (

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

  ) ]
}

