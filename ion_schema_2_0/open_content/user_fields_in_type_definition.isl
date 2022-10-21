$ion_schema_2_0

$test::{
  description: "Unreserved symbols should always be permitted as user field names in a type definition",
  valid_schemas: [
    (
      $ion_schema_2_0
      type::{ name: type_0, '': 0, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_1, $lower_snake_case_with_a_leading_dollar_sign: 1, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_2, _lower_snake_case_with_leading_underscore: 2, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_3, SCREAMING_SNAKE_CASE: 3, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_4, 'UPPER-KEBAB-CASE': 4, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_5, 'lower-kebab-case': 5, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_6, camelCase: 6, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_7, 'name with whitespace': 7, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_8, '🥧_foo': 8, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_9, 'é∑å®ê': 9, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_10, _: 10, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_11, $: 11, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_12, 'éomer': 12, }
    ),
    (
      $ion_schema_2_0
      type::{ name: type_13, $ion_schemabutnotreally: 13, }
    ),
    (
      $ion_schema_2_0
      type::{
        name: type_14,
        // User fields in an inline type definition
        element: { _lorem_ipsum: 1 },
      }
    ),
    (
      $ion_schema_2_0
      type::{
        name: type_15,
        fields: {
          foo: {
            // User field in a variably-occuring type definition
            occurs: required,
            _lorem_ipsum: 1
          }
        },
      }
    ),
  ],
}

$test::{
  description: "Reserved symbols that are not declared as user fields should not be a legal field name in the type definition",
  isl_for_isl_can_validate: false,
  invalid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: type_with_illegal_field_name,
        $ion_schema: 1
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: type_with_illegal_field_name,
        $ion_schema_abc: 1
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: type_with_illegal_field_name,
        $ion_schema_2_0: 1
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: type_with_illegal_field_name,
        lower_snake_case: 1
      }
      schema_footer::{}
    )
  ]
}

$test::{
  description: "Any symbols that are declared as user fields for type definitions should be permitted as field names in a type definition",
  valid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [$ion_schema] } }
      type::{ name: type_with_legal_field_name, $ion_schema: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [$ion_schema_abc] } }
      type::{ name: type_with_legal_field_name, $ion_schema_abc: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [$ion_schema_2_0] } }
      type::{ name: type_with_legal_field_name, $ion_schema_2_0: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [lower_snake_case] } }
      type::{ name: type_with_legal_field_name, lower_snake_case: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [lower_snake_case] } }
      type::{
        name: type_with_legal_field_name_in_nested_definition,
        element: { lower_snake_case: 1 },
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { type: [lower_snake_case] } }
      type::{
        name: type_with_legal_field_name_in_variably_occuring_type_definition,
        fields: {
          foo: {
            occurs: required,
            lower_snake_case: 1
          }
        },
      }
      schema_footer::{}
    ),
  ]
}
