$ion_schema_2_0

type::{
  name: struct_of_lists,
  type: struct,
  element: { id: "imports/cycles/inline_import_a.isl", type: list_of_structs }
}

$test::{
  type: struct_of_lists,
  should_accept_as_valid: [
    {},
    { a: [{}] },
  ],
}
