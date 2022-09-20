$ion_schema_1_0
$test::{
  description: "top-level type that doesn't have a name",
  invalid_schema: (

    $ion_schema_1_0
    schema_header::{}
    type::{
      type: int,
    }
    schema_footer::{}

  )
}

$test::{
  description: "top-level type named null",
  invalid_schema: (

    $ion_schema_1_0
    schema_header::{}
    type::{
      name: null,
      type: int,
    }
    schema_footer::{}

  )
}

$test::{
  description: "top-level type named null.symbol",
  invalid_schema: (

    $ion_schema_1_0
    schema_header::{}
    type::{
      name: null.symbol,
      type: int,
    }
    schema_footer::{}

  )
}
