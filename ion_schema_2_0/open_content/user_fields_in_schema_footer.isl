$ion_schema_2_0

$test::{
  description: "Unreserved symbols should always be permitted as user field names in a schema footer",
  valid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ '': 0 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ $lower_snake_case_with_a_leading_dollar_sign: 1 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ _lower_snake_case_with_leading_underscore: 2 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ SCREAMING_SNAKE_CASE: 3 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ 'UPPER-KEBAB-CASE': 4 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ 'lower-kebab-case': 5 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ camelCase: 6 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ 'name with whitespace': 7 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ '🥧_foo': 8 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ 'é∑å®ê': 9 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ _: 10 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ $: 11 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ 'éomer': 12 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ $ion_schemabutnotreally: 13 }
    ),
  ]
}

$test::{
  description: "Reserved symbols that are not declared as user fields should not be permitted as user field names in the schema footer",
  isl_for_isl_can_validate: false,
  invalid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ $ion_schema: 1 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ $ion_schema_abc: 1 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ $ion_schema_2_0: 1 }
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      schema_footer::{ lower_snake_case: 1 }
    ),
  ]
}

$test::{
  description: "Any symbols that are declared as user fields for the schema footer should be permitted as field names in the schema footer",
  valid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [$ion_schema] } }
      schema_footer::{ $ion_schema: 1 }
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [$ion_schema_abc] } }
      schema_footer::{ $ion_schema_abc: 1 }
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [$ion_schema_2_0] } }
      schema_footer::{ $ion_schema_2_0: 1 }
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_reserved_fields: { schema_footer: [lower_snake_case] } }
      schema_footer::{ lower_snake_case: 1 }
    ),
  ]
}
