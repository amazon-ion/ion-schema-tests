$ion_schema_1_0
$test::{
  description: "fields must be a struct of type references",
  invalid_types: [
    { fields: null },
    { fields: null.int },
    { fields: null.struct },
    { fields: 5 },
    { fields: [] },
    { fields: () },
    { fields: {} },
    { fields: { a: null } },
    { fields: { a: null.struct } },
    { fields: { a: null.symbol } },
    { fields: { a: 5 } },
    { fields: { a: () } },
    { fields: { a: [] } },
  ]
}
