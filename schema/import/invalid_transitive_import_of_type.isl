// type 'positive_int' should not be recognized in this schema:
invalid_schema::document::'''
  schema_header::{
    imports: [
      { id: "schema/import/import_type.isl" },
    ],
  }
  type::{
    name: attempted_transitive_import_of_type,
    type: positive_int,
  }
  schema_footer::{}
'''
