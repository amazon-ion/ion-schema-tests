$ion_schema_1_0
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

$test::{
  type: diamond_import,
  should_accept_as_valid: [
    {
      a: { foo: c },
      b: { bar: c },
    },
  ],
}
