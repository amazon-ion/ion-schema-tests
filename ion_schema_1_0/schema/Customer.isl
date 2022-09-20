$ion_schema_1_0
schema_header::{
  imports: [
    { id: "schema/util/positive_int.isl", type: positive_int }
  ],
}
type::{
  name: Customer,
  type: struct,
  fields: {
    firstName: { type: string, occurs: required },
    middleName: string,
    lastName: { type: string, codepoint_length: range::[min, 7], occurs: required },
    age: { type: positive_int },
  }
}
schema_footer::{
}

$test::{
  type: Customer,
  should_accept_as_valid: [
    { firstName: "Phil", lastName: "Collins" },
    { firstName: "Phil", lastName: "Collins", middleName: "Billy" },
    { firstName: "Phil", lastName: "Collins", age: 68 },
  ],
  should_reject_as_invalid: [
    { firstName: "Phil", middleName: "Billy" },
    { firstName: "Phil", lastName: "Collins", age: -1 },
  ],
}
