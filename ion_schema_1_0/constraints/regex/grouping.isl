$ion_schema_1_0
type::{
  name: regex_grouping,
  regex: "123(ab|cd|ef)456",
}
$test::{
  type: regex_grouping,
  should_accept_as_valid: [
    "123ab456",
    "123cd456",
    "123ef456",
  ],
  should_reject_as_invalid: [
    "123a456",
    "123ac456",
    "123ace456",
    "123bdf456",
  ]
}
