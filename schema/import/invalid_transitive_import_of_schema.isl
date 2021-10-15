// types 'a', 'b', 'c', 'd', and 'e' should not be recognized in this schema:
invalid_schema::document::'''
  schema_header::{
    imports: [
      { id: "schema/import/import.isl" },
    ],
  }
  type::{
    name: attempted_transitive_import_of_schema,
    ordered_elements: [a, b, c, d, e],
  }
  schema_footer::{}
'''
