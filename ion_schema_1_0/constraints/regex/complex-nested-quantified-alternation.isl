$ion_schema_1_0
type::{
  name: regex_complex_nested_quantified_alternation,
  regex: "^(ab|(cd){2,3}|ef){2}$",
}
$test::{
  type: regex_complex_nested_quantified_alternation,
  should_accept_as_valid: [
    abab,
    abcdcd,
    abcdcdcd,
    abef,
    cdcdab,
    cdcdcdab,
    cdcdcdcd,
    cdcdcdcdcd,
    cdcdcdcdcdcd,
    cdcdcdef,
    cdcdef,
    efab,
    efcdcd,
    efcdcdcd,
    efef,
  ],
  should_reject_as_invalid: [
    "",
    ab,
    abcdcdcdcd,
    cd,
    cdcd,
    cdcdcd,
    cdcdcdcdcdcdcd,
    cdcdcdcdef,
    ef,
  ]
}
