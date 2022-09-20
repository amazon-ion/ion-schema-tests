$ion_schema_1_0
$test::{
  description: "not must be a type reference",
  invalid_types: [
    { not: null },
    { not: null.symbol },
    { not: null.struct },
    { not: 5 },
    { not: [] },
    { not: () },
  ]
}
