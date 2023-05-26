$ion_schema_2_0

$test::{
  description: "Schema footer can optionally be present at the end of a schema",
  valid_schemas: [
    (
    $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo
      }
      schema_footer::{}
    ),
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
  description: "Everything after the schema footer has no bearing on the schema.",
  valid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo
      }
      schema_footer::{}

      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo
      }
      schema_footer::{}

      schema_header::{}
    ),
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
    (
      $ion_schema_2_0
      schema_header::{}
      type::{
        name: foo,
      }
      schema_footer::{}

      $ion_schema_0_0
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
