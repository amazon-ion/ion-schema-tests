$ion_schema_2_0

type::{
  name: regex_alternation,
  regex: "ab|cd|ef",
}
$test::{
  type: regex_alternation,
  should_accept_as_valid: [
    "ab",
    "cd",
    "ef",
  ],
  should_reject_as_invalid: [
    "a",
    "ac",
    "ace",
    "bdf",
  ]
}

type::{
  name: regex_boundary_line_begin,
  regex: "^abc",
}
$test::{
  type: regex_boundary_line_begin,
  should_accept_as_valid: [
    "abc",
  ],
  should_reject_as_invalid: [
    " abc",
  ]
}

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

type::{
  name: regex_case_insensitive,
  regex: i::"hello",
}
$test::{
  type: regex_case_insensitive,
  should_accept_as_valid: [
    hello,
    HellO,
    "hello",
    "HELLO",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    '',
    "",
    'goodbye',
  ]
}

type::{
  name: regex_case_sensitive,
  regex: "hello",
}
$test::{
  type: regex_case_sensitive,
  should_accept_as_valid: [
    hello,
    "hello",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    '',
    "",
    HellO,
    "HELLO",
  ]
}

type::{
  name: regex_character_any,
  regex: "^.$",
}
$test::{
  type: regex_character_any,
  should_accept_as_valid: [
    "a",
    "B",
    "9",
    "😊",
  ],
  should_reject_as_invalid: [
    null,
    "",
    "\n",
    "\r",
  ]
}

type::{
  name: regex_character_class_compound_negated,
  regex: "[^ac-eh-jmnt-vz]",
}
$test::{
  type: regex_character_class_compound_negated,
  should_accept_as_valid: [
    "b",
    "f",
    "g",
    "k",
    "l",
    "o",
    "p",
    "q",
    "r",
    "s",
    "w",
    "x",
    "y",
  ],
  should_reject_as_invalid: [
    "a",
    "c",
    "d",
    "e",
    "h",
    "i",
    "j",
    "m",
    "n",
    "t",
    "u",
    "v",
    "z",
  ]
}

type::{
  name: regex_character_class_dot,
  regex: "[.]",
}
$test::{
  type: regex_character_class_dot,
  should_accept_as_valid: [
    '.',
    ".",
  ],
  should_reject_as_invalid: [
    'a',
    "a",
  ]
}

type::{
  name: regex_character_class_escape_chars,
  regex: "[\\[\\]\\\\]",
}
$test::{
  type: regex_character_class_escape_chars,
  should_accept_as_valid: [
    "[",
    "]",
    "\\", //"// <-- This extra comment markers and quote is to stop intellij from messing up the code formatting. https://github.com/amzn/ion-intellij-plugin/issues/40
  ],
  should_reject_as_invalid: [
    "a",
    ".",
  ]
}

type::{
  name: regex_character_class_negated,
  regex: "[^bcd]",
}
$test::{
  type: regex_character_class_negated,
  should_accept_as_valid: [
    "a",
    "e",
  ],
  should_reject_as_invalid: [
    "b",
    "c",
    "d",
  ]
}

type::{
  name: regex_character_class_special_chars,
  regex: "[\0\a\b\t\n\v\f\r]",
}
$test::{
  type: regex_character_class_special_chars,
  should_accept_as_valid: [
    "\0",
    "\a",
    "\b",
    "\t",
    "\n",
    "\v",
    "\f",
    "\r",
  ],
  should_reject_as_invalid: [
    "a",
    ".",
  ]
}

type::{
  name: regex_character_class_word_char,
  regex: "[A-Za-z0-9]",
}
$test::{
  type: regex_character_class_word_char,
  should_accept_as_valid: [
    "A",
    "M",
    "Z",
    "a",
    "n",
    "z",
    "0",
    "5",
    "9",
  ],
  should_reject_as_invalid: [
    " ",
    ".",
    "\t",
    "#",
    "~",
  ]
}

type::{
  name: regex_character_class,
  regex: "[bcd]",
}
$test::{
  type: regex_character_class,
  should_accept_as_valid: [
    "b",
    "c",
    "d",
  ],
  should_reject_as_invalid: [
    "a",
    "e",
  ]
}

type::{
  name: regex_character_range_negated,
  regex: "[^b-g]",
}
$test::{
  type: regex_character_range_negated,
  should_accept_as_valid: [
    "a",
    "i",
  ],
  should_reject_as_invalid: [
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
  ]
}

type::{
  name: regex_character_range,
  regex: "[b-g]",
}
$test::{
  type: regex_character_range,
  should_accept_as_valid: [
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
  ],
  should_reject_as_invalid: [
    "a",
    "i",
  ]
}

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

type::{
  name: regex_escape_characters,
  // There is an space at the end of this regex because the Ion plugin doesn't handle escaped backsalshes at the end
  // of a string correctly. See https://github.com/amzn/ion-intellij-plugin/issues/40.
  regex: "\\.\\^\\$\\|\\?\\*\\+\\[\\]\\(\\)\\{\\}\\\\ ",
}
$test::{
  type: regex_escape_characters,
  should_accept_as_valid: [
    '.^$|?*+[](){}\\ ',
    ".^$|?*+[](){}\\ ",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    'hello world',
    "hello world",
  ]
}

type::{
  name: regex_escape_double_quote,
  regex: "\"free\"",
}
$test::{
  type: regex_escape_double_quote,
  should_accept_as_valid: [
    '"free"',
    "\"free\"",
    'Totally "free" food!',
    "Totally \"free\" food!",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    '',
    "",
    'free',
    "free",
  ]
}

type::{
  name: regex_escape_forwardslash,
  regex: "a/b",
}
$test::{
  type: regex_escape_forwardslash,
  should_accept_as_valid: [
    'a/b',
    "a/b",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    '',
    "",
    ab,
    "ab",
  ]
}

type::{
  name: regex_escape_single_quote,
  regex: "it's",
}
$test::{
  type: regex_escape_single_quote,
  should_accept_as_valid: [
    'it\'s',
    "it's",
    'I can\'t believe it\'s not butter!',
    "I can't believe it's not butter!",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    '',
    "",
    its,
    "its",
  ]
}

type::{
  name: regex_escape_tab,
  regex: "hello\tworld",
}
$test::{
  type: regex_escape_tab,
  should_accept_as_valid: [
    'hello\tworld',
    'hello	world',
    "hello\tworld",
    "hello	world",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    'hello world',
    "hello world",
  ]
}

type::{
  name: regex_unescaped_tab,
  // There is an unescaped tab character in this regex
  regex: "hello	world",
}
$test::{
  type: regex_unescaped_tab,
  should_accept_as_valid: [
    'hello\tworld',
    'hello	world',
    "hello\tworld",
    "hello	world",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    'hello world',
    "hello world",
  ]
}

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

type::{
  name: regex_ion_escape_characters,
  regex: "\0\a\b\t\n\f\r\v",
}
$test::{
  type: regex_ion_escape_characters,
  should_accept_as_valid: [
    '\0\a\b\t\n\f\r\v',
    "\0\a\b\t\n\f\r\v",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    'hello world',
    "hello world",
  ]
}

type::{
  name: regex_multiline,
  regex: m::"^hello world$",
}
$test::{
  type: regex_multiline,
  should_accept_as_valid: [
    'hello world',
    'hello world\n\n\n',
    '\n\n\nhello world',
    '\n\n\nhello world\n\n\n',
    '\r\r\rhello world\r\r\r',

    "hello world",
    "hello world\n\n\n",
    "\n\n\nhello world",
    "\n\n\nhello world\n\n\n",
    "\r\r\rhello world\r\r\r",
  ],
  should_reject_as_invalid: [
    null,
    null.null,
    null.string,
    null.symbol,
    null.bool,
    " hello world",
    "hello world ",
    "\n hello world",
    "hello world \n",
    "hello\n world",
    "hello \nworld",
    "hello\r world",
    "hello \rworld",
  ]
}

type::{
  name: regex_predefined_character_class_digit,
  regex: "\\d",
}
$test::{
  type: regex_predefined_character_class_digit,
  should_accept_as_valid: [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
  ],
  should_reject_as_invalid: [
    "/",
    ":",
  ]
}

type::{
  name: regex_predefined_character_class_non_digit,
  regex: "\\D",
}
$test::{
  type: regex_predefined_character_class_non_digit,
  should_accept_as_valid: [
    "/",
    ":",
  ],
  should_reject_as_invalid: [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
  ]
}

type::{
  name: regex_predefined_character_class_non_whitespace,
  regex: "\\S",
}
$test::{
  type: regex_predefined_character_class_non_whitespace,
  should_accept_as_valid: [
    "\0",
    "\b",
    "\v",
    "a",
    "9",
  ],
  should_reject_as_invalid: [
    " ",
    "\f",
    "\n",
    "\r",
    "\t",
  ]
}

type::{
  name: regex_predefined_character_class_non_word,
  regex: "\\W",
}
$test::{
  type: regex_predefined_character_class_non_word,
  should_accept_as_valid: [
    "/",
    ":",
    "@",
    "[",
    "`",
    "{",
  ],
  should_reject_as_invalid: [
    "a",
    "A",
    "z",
    "Z",
    "0",
    "9",
  ]
}

type::{
  name: regex_predefined_character_class_whitespace,
  regex: "\\s",
}
$test::{
  type: regex_predefined_character_class_whitespace,
  should_accept_as_valid: [
    " ",
    "\f",
    "\n",
    "\r",
    "\t",
  ],
  should_reject_as_invalid: [
    "\0",
    "\b",
    "\v",
    "a",
    "9",
  ]
}

type::{
  name: regex_predefined_character_class_word,
  regex: "\\w",
}
$test::{
  type: regex_predefined_character_class_word,
  should_accept_as_valid: [
    "a",
    "A",
    "z",
    "Z",
    "0",
    "9",
    "_",
  ],
  should_reject_as_invalid: [
    "/",
    ":",
    "@",
    "[",
    "`",
    "{",
    "-",
  ]
}

type::{
  name: regex_character_class_compound,
  regex: "[ac-eh-jmnt-vz]",
}
$test::{
  type: regex_character_class_compound,
  should_accept_as_valid: [
    "a",
    "c",
    "d",
    "e",
    "h",
    "i",
    "j",
    "m",
    "n",
    "t",
    "u",
    "v",
    "z",
  ],
  should_reject_as_invalid: [
    "b",
    "f",
    "g",
    "k",
    "l",
    "o",
    "p",
    "q",
    "r",
    "s",
    "w",
    "x",
    "y",
  ]
}

type::{
  name: regex_character_class_unioned_with_d_metachar_class,
  regex: "[a-f\\d]",
}
$test::{
  type: regex_character_class_unioned_with_d_metachar_class,
  should_accept_as_valid: [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
  ],
  should_reject_as_invalid: [
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "A",
    " ",
  ]
}

type::{
  name: regex_character_class_unioned_with_D_metachar_class,
  regex: "[0\\D]",
}
$test::{
  type: regex_character_class_unioned_with_D_metachar_class,
  should_accept_as_valid: [
    "0",
    "a",
    "B",
    "[",
    "}",
    "π",
    " ",
    "\n",
    ".",
    "@",
    "🤨",
  ],
  should_reject_as_invalid: [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
  ]
}

type::{
  name: regex_character_class_unioned_with_w_metachar_class,
  regex: "[@\\w]",
}
$test::{
  type: regex_character_class_unioned_with_w_metachar_class,
  should_accept_as_valid: [
    "0",
    "1",
    "2",
    "3",
    "a",
    "b",
    "c",
    "D",
    "E",
    "F",
    "_",
    "@",
  ],
  should_reject_as_invalid: [
    "}",
    "π",
    " ",
    "\n",
    "\t",
    "\b",
    ".",
    "#",
    "🤨",
  ]
}

type::{
  name: regex_character_class_unioned_with_W_metachar_class,
  regex: "[abc\\W]",
}
$test::{
  type: regex_character_class_unioned_with_W_metachar_class,
  should_accept_as_valid: [
    "a",
    "b",
    "c",
    "[",
    "}",
    "π",
    " ",
    "\n",
    ".",
    "@",
    "🤨",
  ],
  should_reject_as_invalid: [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "d",
    "e",
    "f",
    "A",
    "B",
    "C",
    "_",
  ]
}

type::{
  name: regex_character_class_unioned_with_s_metachar_class,
  regex: "[abc\\s]",
}
$test::{
  type: regex_character_class_unioned_with_s_metachar_class,
  should_accept_as_valid: [
    "a",
    "b",
    "c",
    " ",
    "\f",
    "\r",
    "\t",
    "\n",
  ],
  should_reject_as_invalid: [
    "0",
    "1",
    "2",
    "3",
    "}",
    "π",
    ".",
    "@",
    "🤨",
    "\b",
  ]
}

type::{
  name: regex_character_class_unioned_with_S_metachar_class,
  regex: "[ \\S]",
}
$test::{
  type: regex_character_class_unioned_with_S_metachar_class,
  should_accept_as_valid: [
    "0",
    "a",
    "B",
    "[",
    "}",
    "π",
    ".",
    "@",
    "🤨",
    "\b",
    " ",
  ],
  should_reject_as_invalid: [
    "\f",
    "\n",
    "\r",
    "\t",
  ]
}

type::{
  name: regex_quantifier_at_least_n,
  regex: "ab{3,}c",
}
$test::{
  type: regex_quantifier_at_least_n,
  should_accept_as_valid: [
    "abbbc",
    "abbbbc",
    "abbbbbc",
  ],
  should_reject_as_invalid: [
    "ac",
    "abc",
    "abbc",
  ]
}

type::{
  name: regex_quantifier_exactly_n,
  regex: "ab{3}c",
}
$test::{
  type: regex_quantifier_exactly_n,
  should_accept_as_valid: [
    "abbbc",
  ],
  should_reject_as_invalid: [
    "abbc",
    "abbbbc",
  ]
}

type::{
  name: regex_quantifier_one_to_many,
  regex: "ab+c",
}
$test::{
  type: regex_quantifier_one_to_many,
  should_accept_as_valid: [
    "abc",
    "abbc",
    "abbbc",
  ],
  should_reject_as_invalid: [
    "ac",
  ]
}

type::{
  name: regex_quantifier_range,
  regex: "ab{3,6}c",
}
$test::{
  type: regex_quantifier_range,
  should_accept_as_valid: [
    "abbbc",
    "abbbbc",
    "abbbbbc",
    "abbbbbbc",
  ],
  should_reject_as_invalid: [
    "abbc",
    "abbbbbbbc",
  ]
}

type::{
  name: regex_quantifier_zero_or_one,
  regex: "ab?c",
}
$test::{
  type: regex_quantifier_zero_or_one,
  should_accept_as_valid: [
    "ac",
    "abc",
  ],
  should_reject_as_invalid: [
    "abbc",
  ]
}

type::{
  name: regex_quantifier_zero_to_many,
  regex: "ab*c",
}
$test::{
  type: regex_quantifier_zero_to_many,
  should_accept_as_valid: [
    "ac",
    "abc",
    "abbc",
    "abbbc",
  ],
  should_reject_as_invalid: [
    "",
    "ab",
    "bc",
  ]
}

type::{
  name: regex_special_characters,
  regex: "\0\a\b\t\n\v\f\r",
}
$test::{
  type: regex_special_characters,
  should_accept_as_valid: [
    '\0\a\b\t\n\v\f\r',
    "\0\a\b\t\n\v\f\r",
  ],
  should_reject_as_invalid: [
    a,
    "A",
  ]
}

type::{
  name: regex_unicode_emoji,
  regex: "^[😀\U0001f642😊]{3,6}$",
}
$test::{
  type: regex_unicode_emoji,
  should_accept_as_valid: [
    "😊😀🙂",
    "🙂🙂🙂🙂",
    "😊😊😊😊😊",
    "😊😀🙂😊😀🙂",
    "\U0001f600\U0001f600\U0001f600",
  ],
  should_reject_as_invalid: [
    "😊😀",
    "😊😀🙂😊😀🙂😊",
  ]
}
