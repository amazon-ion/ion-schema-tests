schema_header::{
  imports: [
    { id: "schema/import/diamond_import_a.isl" },
    { id: "schema/import/diamond_import_b.isl" },
  ],
}
type::{
  name: diamond_import,
  fields: {
    a: a,
    b: b,
  }
}
schema_footer::{ }

valid::{
  diamond_import: [
    {
      a: { foo: c },
      b: { bar: c },
    },
  ],
}
