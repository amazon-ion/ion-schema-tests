$ion_schema_1_0
$test::{
  description: "ordered_elements must be a list of type references",
  invalid_types: [
    { ordered_elements: null },
    { ordered_elements: null.int },
    { ordered_elements: null.list },
    { ordered_elements: x },
    { ordered_elements: () },
    { ordered_elements: {} },
  ]
}
