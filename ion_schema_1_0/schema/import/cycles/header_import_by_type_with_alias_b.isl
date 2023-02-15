schema_header::{
  imports: [
    { id: "schema/import/cycles/header_import_by_type_a.isl", type: list_of_structs, as: foo }
  ]
}

type::{
  name: struct_of_lists,
  type: struct,
  element: foo
}

$test::{
  type: struct_of_lists,
  should_accept_as_valid: [
    {},
    { a: [{}] },
  ],
}

schema_footer::{}
