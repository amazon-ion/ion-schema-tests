$ion_schema_1_0

type::{
  name: all_of_core_types,
  all_of: [
    string,
    symbol,
    any,
  ],
}

$test::{
  type: all_of_core_types,
  should_reject_as_invalid:[
    true,
    5,
    "hi",
    hi,
    ]
}
