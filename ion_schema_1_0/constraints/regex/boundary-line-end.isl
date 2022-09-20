$ion_schema_1_0
type::{
  name: regex_boundary_line_end,
  regex: "abc$",
}
$test::{
  type: regex_boundary_line_end,
  should_accept_as_valid: [
    "abc",
  ],
  should_reject_as_invalid: [
    "abc ",
  ]
}
