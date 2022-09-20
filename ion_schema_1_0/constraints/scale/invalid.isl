$ion_schema_1_0
$test::{
  description: "scale must be an integer or range",
  invalid_types: [
    { scale: null },
    { scale: null.int },
    { scale: null.list },
    { scale: x },
    { scale: -1 },
    { scale: 5.2 },
    { scale: [0, 5] },
    { scale: range::[min, max] },
    { scale: range::[1, 0] },
    { scale: range::[1] },
    { scale: range::[0, 1, 2] },
    { scale: range::[0d0, 1] },
    { scale: range::[0e0, 1] },
    { scale: range::[0, 1d0] },
    { scale: range::[0, 1e0] },
  ]
}
