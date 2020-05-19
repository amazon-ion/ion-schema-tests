// top-level type that doesn't have a name
invalid_schema::document::'''
  schema_header::{}
  type::{
    type: int,
  }
  schema_footer::{}
'''

// top-level type named null
invalid_schema::document::'''
  schema_header::{}
  type::{
    name: null,
    type: int,
  }
  schema_footer::{}
'''

// top-level type named null.symbol
invalid_schema::document::'''
  schema_header::{}
  type::{
    name: null.symbol,
    type: int,
  }
  schema_footer::{}
'''

