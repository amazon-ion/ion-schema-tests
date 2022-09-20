$ion_schema_1_0
type::{
  name: content_struct_mixed,
  type: struct,
  content: closed,
  fields: {                   // closed
    a: symbol,
    b: type::{
      type: struct,
      fields: {               // open
        x: symbol,
      },
    },
    c: type::{                // closed
      type: struct,
      content: closed,
      fields: {
        y: symbol,
      },
    },
  },
}
$test::{
  type: content_struct_mixed,
  should_accept_as_valid: [
    { },
    { a: a, b: { x: x, y: y, z: z }, c: { y: y } },
  ],
  should_reject_as_invalid: [
    { d: d },
    { c: { z: z } },
  ]
}
