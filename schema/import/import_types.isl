schema_header::{
  imports: [
    { id: "schema/import/abcde.isl", type: a, as: a2 },
    { id: "schema/util/positive_int.isl" },
    { id: "schema/import/abcde.isl", type: b },
    { id: "schema/util/positive_int.isl", type: positive_int, as: posint },
    { id: "schema/import/abcde.isl", type: c, as: c2 },
  ],
}
type::{
  name: import_types_test,
  type: struct,
  fields: {
    a2: a2,
    positive_int: positive_int,
    b: b,
    posint: posint,
    c2: c2,
  },
}
schema_footer::{
}

valid::[
  { a: a, positive_int: 5, b: b, posint: 6, c: c },
]

invalid::[
  { a: b, positive_int:  5, b: b, posint:  6, c: c },
  { a: a, positive_int: -1, b: b, posint:  6, c: c },
  { a: a, positive_int:  5, b: a, posint:  6, c: c },
  { a: a, positive_int:  5, b: b, posint: -1, c: c },
  { a: a, positive_int:  5, b: b, posint:  6, c: b },
]

