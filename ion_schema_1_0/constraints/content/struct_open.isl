$ion_schema_1_0
type::{
  name: content_struct_open,
  type: struct,   // open content
  fields: {
    a: string,
    b: int,
    c: symbol,
  },
}
$test::{
  type: content_struct_open,
  should_accept_as_valid: [
    { },
    { a: "hi" },
    { a: "hi", b: 1 },
    { a: "hi", b: 1, c: hi },
    {          b: 1, c: hi },
    {                c: hi },
    { a: "hi",       c: hi },
    { x: 0 },
    { x: 1, a: "hi", b: 1, c: hi, z: 2 },
  ]
}
