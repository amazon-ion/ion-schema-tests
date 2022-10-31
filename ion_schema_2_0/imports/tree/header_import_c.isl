$ion_schema_2_0

schema_header::{
  imports: [
    { id: "imports/tree/header_import_d.isl" },
    { id: "imports/tree/header_import_e.isl" },
  ]
}

type::{
  name: c_type,
  annotations: { valid_values: [[c]] },
  fields: closed::{
    d: d_type,
    e: e_type,
  },
}

schema_footer::{}
