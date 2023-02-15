schema_header::{
  imports: [
    { id: "schema/import/cycles/header_import_b.isl" }
  ]
}

type::{
  name: list_of_structs,
  type: list,
  element: struct_of_lists,
}

$test::{
  type: list_of_structs,
  should_accept_as_valid: [
    [],
    [{a:[]}],
  ],
}
schema_footer::{}
