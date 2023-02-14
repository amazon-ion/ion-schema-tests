$ion_schema_2_0

$test::{
  description: "imports field must be a non-null list",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports:(),
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:null.list,
      }
      schema_footer::{}
    )
  ]
}

$test::{
  description: "imports field may occur at most one time in the schema header",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports:[],
        imports:[],
      }
      schema_footer::{}
    ),
    (
      // Still wrong even though the second instance is the wrong type to be a valid imports field.
      $ion_schema_2_0
      schema_header::{
        imports:[],
        imports:(),
      }
      schema_footer::{}
    )
  ]
}

$test::{
  description: "header imports may not have unexpected fields",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "util.isl", foo: bar  }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "util.isl", type: positive_int, foo: bar  }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "util.isl", type: positive_int, as: foo, foo: bar  }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          // "as" is unexpected because "type" is not present.
          { id: "util.isl", as: foo  }
        ]
      }
      schema_footer::{}
    ),
  ]
}

$test::{
  description: "inline imports must have exactly one each of 'id' and 'type' fields and nothing else",
  // Note, however, that a struct without 'id' will be considered an inline type rather than an inline import.
  invalid_schemas: [
    (
      $ion_schema_2_0
      type::{
        name: foo,
        type: { id: "util.isl", type: positive_int, foo: bar  }
      }
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo,
        type: { id: "util.isl", type: positive_int, as: foo }
      }
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo,
        type: { id: "util.isl", as: bar  }
      }
    ),
  ]
}

$test::{
  description: "imports may not have repeated field names",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports: [
          { id: "util.isl", id: "util.isl" }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "util.isl", type: positive_int, type: positive_int }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "util.isl", type: positive_int, as: foo, as: foo }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo,
        type: { id: "util.isl", id: "util.isl", type: positive_int }
      }
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo,
        type: { id: "util.isl", type: positive_int, type: positive_int }
      }
    ),
  ]
}

$test::{
  description: "imports may not have unexpected annotations",
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports: foo::[
          { id: "util.isl" }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          foo::{ id: "util.isl" }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: foo::"util.isl" }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "util.isl", type: $null_or::positive_int }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "util.isl", type: positive_int, as: $null_or::foo }
        ]
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo,
        type: foo::{ id: "util.isl", type: positive_int }
      }
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo,
        type: { id: foo::"util.isl", type: positive_int }
      }
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo,
        type: { id: "util.isl", type: $null_or::positive_int }
      }
    ),
  ]
}

$test::{
  description: "when imported schema or type does not exist, should be an invalid schema",
  isl_for_isl_can_validate: false,
  invalid_schemas: [
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "abc/def/ghi/jkl" }
        ],
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      schema_header::{
        imports:[
          { id: "util.isl", type: non_existent_type }
        ],
      }
      schema_footer::{}
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo,
        not: { id: "abc/def/ghi/jkl", type: non_existent_type },
      }
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo,
        not: { id: "util.isl", type: non_existent_type },
      }
    ),
  ]
}
