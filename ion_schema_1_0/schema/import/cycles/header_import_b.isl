schema_header::{
  imports: [
    { id: "schema/import/cycles/header_import_a.isl" }
  ]
}

type::{
  name: struct_of_lists,
  type: struct,
  element: list_of_structs
}

$test::{
  type: struct_of_lists,
  should_accept_as_valid: [
    {},
    { a: [{}] },
  ],
}

schema_footer::{}
