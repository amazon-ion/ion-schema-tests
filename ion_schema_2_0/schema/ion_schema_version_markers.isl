$ion_schema_2_0

$test::{
  description: "Schema should have only one Ion Schema version marker.",
  invalid_schemas:[
    (
      $ion_schema_2_0
      $ion_schema_1_0
      header::{}
      type::{
        name: foo
      }
      footer::{}
    ),
    (
      $ion_schema_2_0
      $ion_schema_2_0
      header::{}
      type::{
        name: foo
      }
      footer::{}
    ),
    (
      $ion_schema_2_0
      header::{}
      type::{
        name: foo
      }
      footer::{}
      $ion_schema_2_0
    ),
    (
      $ion_schema_2_0
      type::{
        name: foo
      }
      $ion_schema_2_0
    ),
  ]
}

$test::{
  description: "Ion Schema version marker must be a real version.",
  // Note—'$ion_schema_2_1' is intentionally not in this list because any implementation that supports
  // the hypothetical Ion Schema 2.1 must also support Ion Schema 2.0 (and pass these tests)
  invalid_schemas:[
    (
      $ion_schema_0_1
      type::{
        name: foo
      }
      footer::{}
    ),
    (
      $ion_schema_2_x
      type::{
        name: foo
      }
      footer::{}
    ),
  ]
}

$test::{
  description: "Ion Schema version marker must come before header if header is present.",
  invalid_schemas:[
    (
      header::{}
      $ion_schema_2_0
      type::{
        name: foo
      }
      footer::{}
    )
  ]
}

$test::{
  description: "Ion Schema version marker must come before any types.",
  invalid_schemas:[
    (
      type::{
        name: foo,
      }
      $ion_schema_2_0
      type::{
        name: bar,
      }
    )
  ]
}
