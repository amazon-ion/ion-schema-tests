// type 'positive_int_1' should not be recognized in this schema:
invalid_schema::document::'''
  schema_header::{
    imports: [
      { id: "schema/import/import_type_by_alias.isl" },
    ],
  }
  type::{
    name: attempted_transitive_import_of_type_by_alias,
    type: positive_int_1,
  }
  schema_footer::{}
'''
