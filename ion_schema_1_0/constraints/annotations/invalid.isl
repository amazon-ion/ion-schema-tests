$ion_schema_1_0
$test::{
  description: "annotations must be a list of allowed annotation symbols",
  invalid_types: [
    { annotations: null },
    { annotations: null.list },
    { annotations: () },
    { annotations: {} },
    { annotations: hello },
    { annotations: 5 },
  ]
}
