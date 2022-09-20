$ion_schema_1_0
$test::{
  description: "one_of must be a list of type references",
  invalid_types: [
    { one_of: null.list },
    { one_of: 5 },
    { one_of: () },
    { one_of: {} },
    { one_of: [5] },
  ]
}
