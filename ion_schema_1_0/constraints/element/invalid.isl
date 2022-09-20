$ion_schema_1_0
$test::{
  description: "element should be a type reference",
  invalid_types: [
    { element: null },
    { element: null.int },
    { element: 5 },
    { element: [] },
    { element: () },
  ]
}
