$ion_schema_1_0
$test::{
  description: "type must have a type reference",
  invalid_types: [
    { type: null },
    { type: null.int },
    { type: null.symbol },
    { type: null.struct },
    { type: 5 },
    { type: () },
    { type: [] },
  ]
}
