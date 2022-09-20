$ion_schema_1_0
$test::{
  description: "contains must be a list of values",
  invalid_types: [
    { contains: null },
    { contains: null.int },
    { contains: null.list },
    { contains: x },
    { contains: () },
    { contains: {} },
  ]
}
