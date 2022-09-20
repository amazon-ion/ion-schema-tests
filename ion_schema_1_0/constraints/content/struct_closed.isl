$ion_schema_1_0
type::{
  name: content_struct_closed,
  type: struct,
  content: closed,
  fields: {
    a: string,
    b: int,
    c: symbol,
  },
}
$test::{
  type: content_struct_closed,
  should_accept_as_valid: [
    { },
    { a: "hi" },
    { a: "hi", b: 1 },
    { a: "hi", b: 1, c: hi },
    {          b: 1, c: hi },
    {                c: hi },
    { a: "hi",       c: hi },
  ],
  should_reject_as_invalid: [
    { x: 0 },
    { w: 0, a: "hi", x: 1, b: 1, y: 2, c: hi, z: 3, z: 4 },
  ]
}
