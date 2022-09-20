$ion_schema_1_0

$test::{
  description: "all_of must have a list of type references",
  invalid_types: [
    { all_of: null.list },
    { all_of: 5 },
    { all_of: () },
    { all_of: {} },
    { all_of: [5] },
  ]
}
