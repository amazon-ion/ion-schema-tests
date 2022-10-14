$ion_schema_2_0

$test::{
  description: "Top level type definitions must not have any additional annotations.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      type::$foo::{ name: foo }
    ),
    (
      $ion_schema_2_0
      type::type::{ name: foo }
    ),
    (
      $ion_schema_2_0
      $foo::type::{ name: foo }
    ),
  ],
}

$test::{
  description: "Top level type definitions must be a non-null struct.",
  invalid_schemas: [
    (
      $ion_schema_2_0
      type::null.struct
    ),
    (
      $ion_schema_2_0
      type::[]
    ),
    (
      $ion_schema_2_0
      type::()
    ),
    (
      $ion_schema_2_0
      type::$int
    ),
  ],
}

$test::{
  description: "Top level type definitions must have one name field",
  invalid_schemas: [
    (
      $ion_schema_2_0
      type::{
        // No Name
      }
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo,
        name: bar,
      }
    ),
    (
      $ion_schema_2_0
      type::{
        // Still invalid even if the field value is the same
        name: foo,
        name: foo,
      }
    ),
    (
      $ion_schema_2_0
      type::{
        // Still invalid even if one of the values isn't a symbol
        name: foo,
        name: false,
      }
    ),
  ],
}

$test::{
  description: "Type name field must be a non-null, unannotated symbol",
  invalid_schemas: [
    (
      $ion_schema_2_0
      type::{ name: "foo" }
    ),
    (
      $ion_schema_2_0
      type::{ name: null }
    ),
    (
      $ion_schema_2_0
      type::{ name: null.symbol }
    ),
    (
      $ion_schema_2_0
      type::{ name: foo::bar }
    ),
  ],
}

$test::{
  description: "Type names may not be repeated in a single schema document",
  isl_for_isl_can_validate: false,
  invalid_schemas: [
    (
      $ion_schema_2_0
      type::{ name: foo, type: int }
      type::{ name: foo, type: string }
    ),
    // Even when the types are identical, it's still invalid
    (
      $ion_schema_2_0
      type::{ name: foo }
      type::{ name: foo }
    ),
  ],
}
