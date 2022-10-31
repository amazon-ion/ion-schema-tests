$ion_schema_2_0

/*
Invalid schemas are not valid `ion-schema-tests` test files, but
the invalid self import cases need to be files so that they can
be located by the authority and self-referenced in an import.
Therefore, the actual invalid schemas are given the suffix of
".invalid-isl.ion", and this test file has "invalid_schemas" test
cases that import each of the self-importing invalid schemas.
*/

$test::{
  description: "Self-imports are invalid",
  isl_for_isl_can_validate: false,
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "imports/self_import/header.invalid-isl.ion" }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "imports/self_import/header_by_type.invalid-isl.ion" }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "imports/self_import/header_by_type_with_alias.invalid-isl.ion" }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "imports/self_import/inline.invalid-isl.ion" }
        ]
      }
      schema_footer::{}
    ),
  ]
}
