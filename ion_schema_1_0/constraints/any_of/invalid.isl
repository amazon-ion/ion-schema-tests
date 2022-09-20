$ion_schema_1_0
$test::{
  description: "any_of must have a list of type references",
  invalid_types: [
    { any_of: null.list },
    { any_of: 5 },
    { any_of: () },
    { any_of: {} },
    { any_of: [5] },
  ]
}
