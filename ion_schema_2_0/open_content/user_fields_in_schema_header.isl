$ion_schema_2_0

$test::{
  description: "Unreserved symbols should always be permitted as user field names in a schema header",
  valid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{ '': 0 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ $lower_snake_case_with_a_leading_dollar_sign: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ _lower_snake_case_with_leading_underscore: 2 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ SCREAMING_SNAKE_CASE: 3 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ 'UPPER-KEBAB-CASE': 4 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ 'lower-kebab-case': 5 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ camelCase: 6 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ 'name with whitespace': 7 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ '🥧_foo': 8 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ 'é∑å®ê': 9 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ _: 10 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ $: 11 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ 'éomer': 12 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ $ion_schemabutnotreally: 13 }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "Reserved symbols that are not declared as user fields should not be a legal field name in the schema header",
  isl_for_isl_can_validate: false,
  invalid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{ $ion_schema: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ $ion_schema_abc: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ $ion_schema_2_0: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ lower_snake_case: 1 }
      schema_footer::{}
    )
  ]
}

$test::{
  description: "Any symbols that are declared as user fields for the schema header should be permitted as field names in the schema header",
  valid_schemas:[
    (
      $ion_schema_2_0
      schema_header::{ user_fields: { schema_header: [$ion_schema] }, $ion_schema: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_fields: { schema_header: [$ion_schema_abc] }, $ion_schema_abc: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_fields: { schema_header: [$ion_schema_2_0] }, $ion_schema_2_0: 1 }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{ user_fields: { schema_header: [lower_snake_case] }, lower_snake_case: 1 }
      schema_footer::{}
    ),
  ]
}
