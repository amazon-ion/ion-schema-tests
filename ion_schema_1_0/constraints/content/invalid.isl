$ion_schema_1_0
$test::{
  description: "content may only be followed by the symbol 'closed'",
  invalid_types: [
    { content: null },
    { content: null.int },
    { content: open },
    { content: 5 },
  ]
}
