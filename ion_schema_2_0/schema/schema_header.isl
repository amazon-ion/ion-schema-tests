$ion_schema_2_0

$test::{
  description: "Schema should have at most one schema header.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{}
      schema_header::{}
      type::{
        name: foo
      }
      schema_footer::{}
    )
  ]
}

$test::{
  description: "Schema header must come before any type definitions.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      type::{
        name: foo,
      }
      schema_header::{}
      type::{
        name: bar,
      }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "Schema header must not have any additional annotations.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::type::{}
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::schema_footer::{}
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::$foo::{}
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      $foo::schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
  ],
}

$test::{
  description: "Schema header must be a non-null struct.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::null.struct
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::[]
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::()
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::true
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::'foo'
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
  ],
}
