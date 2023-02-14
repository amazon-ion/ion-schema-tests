$ion_schema_2_0

type::{
  name: positive_int,
  type: int,
  valid_values: range::[1, max],
}

type::{
  name: short_string,
  type: string,
  codepoint_length: range::[0, 10],
}

$test::{
  description: "A schema should be able to import the entirety of another schema",
  valid_schemas: [
    (
      // Imports a schema and uses zero types
      $ion_schema_2_0
      schema_header::{
        imports: [ { id: "imports/header_imports.isl" } ]
      }
      schema_footer::{}
    ),
    (
      // Imports a schema and uses one type
      $ion_schema_2_0
      schema_header::{
        imports: [ { id: "imports/header_imports.isl" } ]
      }
      type::{
        name: non_positive_integer,
        type: int,
        not: positive_int,
      }
      schema_footer::{}
    ),
    (
      // Imports a schema and uses multiple types
      $ion_schema_2_0
      schema_header::{
        imports: [ { id: "imports/header_imports.isl" } ]
      }
      type::{
        name: positive_int_or_short_string,
        one_of: [positive_int, short_string],
      }
      schema_footer::{}
    )
  ]
}

$test::{
  description: "A schema should be able to import a type by name",
  valid_schemas: [
    (
      // Import one by name
      $ion_schema_2_0
      schema_header::{
        imports: [ { id: "imports/header_imports.isl", type: positive_int } ]
      }
      type::{
        name: non_positive_integer,
        type: int,
        not: positive_int,
      }
      schema_footer::{}
    ),
    (
      // Import multiple by name
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl", type: positive_int },
          { id: "imports/header_imports.isl", type: short_string },
        ]
      }
      type::{
        name: positive_int_or_short_string,
        one_of: [positive_int, short_string],
      }
      schema_footer::{}
    )
  ]
}

$test::{
  description: "A schema should be able to import a type with an alias",
  valid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl", type: positive_int, as: positive_int_1 },
        ]
      }
      type::{
        name: one_positive_int,
        ordered_elements: [
          positive_int_1,
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl", type: positive_int, as: positive_int_1 },
          { id: "imports/header_imports.isl", type: positive_int, as: positive_int_2 },
        ]
      }
      type::{
        name: two_positive_ints,
        ordered_elements: [
          positive_int_1,
          positive_int_2,
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl", type: positive_int, as: positive_int_1 },
        ]
      }
      // Ensuring that the original name of the aliased type isn't brought into scope (causing a name conflict)
      type::{
        name: positive_int,
        type: positive_int_1
      }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "A schema should not be able to reference an aliased type by its original name",
  isl_for_isl_can_validate: false,
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports: [ { id: "imports/header_imports.isl", type: positive_int, as: positive_int_2 } ]
      }
      type::{
        name: non_positive_integer,
        type: int,
        not: positive_int,
      }
      schema_footer::{}
    )
  ]
}

$test::{
  description: "A redundant import should not result in an error",
  // These are redundant, but not wrong.
  valid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl", type: positive_int },
          { id: "imports/header_imports.isl", type: positive_int },
        ]
      }
      type::{
        name: non_positive_integer,
        type: int,
        not: positive_int,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl" },
          { id: "imports/header_imports.isl", type: positive_int },
        ]
      }
      type::{
        name: non_positive_integer,
        type: int,
        not: positive_int,
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl" },
          { id: "imports/header_imports.isl", type: positive_int, as: foo },
        ]
      }
      type::{
        name: two_positive_ints,
        ordered_elements: [
          positive_int,
          foo,
        ],
      }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "Two different imported types with the same name or alias should result in an error",
  isl_for_isl_can_validate: false,
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl" },
          { id: "imports/header_imports.isl", type: short_string, as: positive_int },
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl", type: short_string, as: foo },
          { id: "imports/header_imports.isl", type: positive_int, as: foo },
        ]
      }
      schema_footer::{}
    )
  ]
}

$test::{
  description: "Importing a type with the same name or alias as locally defined type should result in an error",
  isl_for_isl_can_validate: false,
  invalid_schemas: [
    (
      // Name conflict from schema import
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl" },
        ]
      }
      type::{
        name: positive_int,
      }
      schema_footer::{}
    ),
    (
      // Name conflict from type import
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl", type: positive_int },
        ]
      }
      type::{
        name: positive_int,
      }
      schema_footer::{}
    ),
    (
      // Name conflict from aliased type import
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl", type: positive_int, as: foo },
        ]
      }
      type::{
        name: foo,
      }
      schema_footer::{}
    ),
    (
      // Name conflict where the conflicting types are structurally identical
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "imports/header_imports.isl", type: positive_int },
        ]
      }
      type::{
        name: positive_int,
        type: int,
        valid_values: range::[1, max],
      }
      schema_footer::{}
    )
  ]
}
