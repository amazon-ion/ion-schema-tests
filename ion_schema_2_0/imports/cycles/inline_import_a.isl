$ion_schema_2_0

type::{
  name: list_of_structs,
  type: list,
  element: { id: "imports/cycles/inline_import_b.isl", type: struct_of_lists },
}

$test::{
  type: list_of_structs,
  should_accept_as_valid: [
    [],
    [{a:[]}],
  ],
}
