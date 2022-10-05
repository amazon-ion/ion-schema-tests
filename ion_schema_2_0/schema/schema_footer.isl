$ion_schema_2_0

$test::{
  description: "Schema should have at most one schema footer.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo
      }
      schema_footer::{}
      schema_footer::{}
    )
  ]
}

$test::{
  description: "Schema footer must be present if header is present.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo
      }
    ),
  ]
}

$test::{
  description: "Schema footer must not be present if header is not present.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      type::{
        name: foo
      }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "Schema footer must come after schema header.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_footer::{}
      schema_header::{}
    ),
  ]
}

$test::{
  description: "Schema footer must come after any type definitions.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::{}
      type::{
        name: bar,
      }
    ),
  ]
}

$test::{
  description: "Schema footer must not have any additional annotations.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::type::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::schema_header::{}
    ),
    (
    $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::$foo::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      $foo::schema_footer::{}
    ),
  ],
}

$test::{
  description: "Schema footer must be a non-null struct.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::null.struct
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::[]
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::()
    ),
    (
    $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::true
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::'foo'
    ),
  ],
}
