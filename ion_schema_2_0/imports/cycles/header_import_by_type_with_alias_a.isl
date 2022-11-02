$ion_schema_2_0

schema_header::{
  imports: [
    { id: "imports/cycles/header_import_by_type_b.isl", type: struct_of_lists, as: foo }
  ]
}

type::{
  name: list_of_structs,
  type: list,
  element: foo,
}

$test::{
  type: list_of_structs,
  should_accept_as_valid: [
    [],
    [{a:[]}],
  ],
}
schema_footer::{}
