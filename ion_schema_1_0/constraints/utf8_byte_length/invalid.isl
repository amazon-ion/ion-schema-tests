$ion_schema_1_0
$test::{
  description: "utf8_byte_length must be a non-negative integer or range",
  invalid_types: [
    { utf8_byte_length: null },
    { utf8_byte_length: null.int },
    { utf8_byte_length: null.list },
    { utf8_byte_length: x },
    { utf8_byte_length: -1 },
    { utf8_byte_length: 5.2 },
    { utf8_byte_length: [0, 5] },
    { utf8_byte_length: range::[min, max] },
    { utf8_byte_length: range::[1, 0] },
    { utf8_byte_length: range::[0] },
    { utf8_byte_length: range::[0, 1, 2] },
    { utf8_byte_length: range::[0d0, 1] },
    { utf8_byte_length: range::[0e0, 1] },
    { utf8_byte_length: range::[0, 1d0] },
    { utf8_byte_length: range::[0, 1e0] },
  ]
}
