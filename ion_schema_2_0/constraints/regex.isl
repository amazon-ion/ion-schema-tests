$ion_schema_2_0

type::{
  name: regex_should_accept_non_null_text,
  regex: ".*",
}
$test::{
  type: regex_should_accept_non_null_text,
  should_accept_as_valid: [
    '',
    abc,
    "",
    "abc",
    foo::"def",
  ],
  should_reject_as_invalid: [
    null,
    null.string,
    null.symbol,
    ["a", "b"],
    (a b c),
    123,
    2022-01-01T,
    {{ "abc" }},
  ]
}

// Test cases for different types of characters

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
    '\'',
    "'",
    "/",
    "@",
  ],
  should_reject_as_invalid: [
    "",
    "\n",
    "\r",
  ]
}

type::{
  name: regex_ion_escape_characters,
  regex: "\0\a\b\t\n\v\f\r",
}
$test::{
  type: regex_ion_escape_characters,
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

type::{
  name: regex_escape_characters,
  regex: "\\\\\\.\\^\\$\\|\\?\\*\\+\\[\\]\\(\\)\\{\\}",
}
$test::{
  type: regex_escape_characters,
  should_accept_as_valid: [
    '\\.^$|?*+[](){}',
    "\\.^$|?*+[](){}",
  ],
  should_reject_as_invalid: [
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
    '',
    "",
    'free',
    "free",
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
    'hello world',
    "hello world",
    "helloworld",
  ]
}

type::{
  name: regex_unescaped_tab,
  // There is an unescaped tab character in this regex between the two words
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
    'hello world',
    "hello world",
    "helloworld",
  ]
}

type::{
  name: regex_unescaped_newline,
  regex: '''hello
world''',
}
$test::{
  type: regex_unescaped_newline,
  should_accept_as_valid: [
    'hello\nworld',
    '''hello
world''',
    "hello\nworld",
  ],
  should_reject_as_invalid: [
    'hello world',
    "hello world",
    "hello\rworld",
    "helloworld",
  ]
}

// Anchors

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
  name: regex_for_an_empty_string,
  regex: "^$",
}
$test::{
  type: regex_for_an_empty_string,
  should_accept_as_valid: [
    "",
    '',
  ],
  should_reject_as_invalid: [
    "a",
    " ",
    "\0",
    "\b",
  ]
}

// Regex modifiers

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
    '',
    "",
    Hello,
    "HELLO",
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
    'hello world\n',
    '\nhello world',
    '\nhello world\n',
    '\rhello world\r',
    '\n\r\nhello world\r\n\r',
    "hello world",
    "hello world\n",
    "\nhello world",
    "\nhello world\n",
    "\rhello world\r",
    "\r\n\rhello world\n\r\n",
    "hello world\ngoodbye world",
    '''
greetings earthling
hello world
bonjour le monde
    ''',
  ],
  should_reject_as_invalid: [
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

// Quantifiers

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
  name: regex_quantifier_at_most_n,
  regex: "ab{0,2}c",
}
$test::{
  type: regex_quantifier_at_most_n,
  should_accept_as_valid: [
    "ac",
    "abc",
    "abbc",
  ],
  should_reject_as_invalid: [
    "abbbc",
    "abbbbc",
    "abbbbbc",
  ]
}

type::{
  name: regex_quantifier_range,
  regex: "ab{2,4}c",
}
$test::{
  type: regex_quantifier_range,
  should_accept_as_valid: [
    "abbc",
    "abbbc",
    "abbbbc",
  ],
  should_reject_as_invalid: [
    "abc",
    "abbbbbc",
  ]
}

// Alternation & Grouping

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
    "bc",
    "ace",
    "bdf",
  ]
}

type::{
  name: regex_alternation_with_anchors,
  regex: "^a|a$",
}
$test::{
  type: regex_alternation_with_anchors,
  should_accept_as_valid: [
    "a",
    "ab",
    "ba",
    "aba",
  ],
  should_reject_as_invalid: [
    "",
    "bab",
    "b",
  ]
}

type::{
  name: regex_grouping,
  regex: "123(abc)?456",
}
$test::{
  type: regex_grouping,
  should_accept_as_valid: [
    "123abc456",
    "123456",
  ],
  should_reject_as_invalid: [
    "123a456",
    "123b456",
    "123c456",
    "123ab456",
    "123ac456",
    "123bc456",
  ]
}

type::{
  name: regex_alternation_in_group,
  regex: "^(ab|cd|ef)$",
}
$test::{
  type: regex_alternation_in_group,
  should_accept_as_valid: [
    ab,
    cd,
    ef
  ],
  should_reject_as_invalid: [
    "",
    abcd,
    abef,
    cdef,
    abcdef,
  ]
}

type::{
  name: regex_repeated_group,
  regex: "^(ab)*$",
}
$test::{
  type: regex_repeated_group,
  should_accept_as_valid: [
    "",
    ab,
    abab,
    ababab,
  ],
  should_reject_as_invalid: [
    a,
    ba,
    aba,
    abba,
    ababa,
  ]
}

type::{
  name: regex_group_of_quantified_alternates,
  regex: "^(a+|b{2})$",
}
$test::{
  type: regex_group_of_quantified_alternates,
  should_accept_as_valid: [
    a,
    aa,
    aaa,
    aaaa,
    bb,
  ],
  should_reject_as_invalid: [
    '',
    b,
    bbb,
    aab,
    abb,
  ]
}

type::{
  name: regex_quantified_group_of_alternates,
  regex: "^(a|bc|def){2,3}$",
}
$test::{
  type: regex_quantified_group_of_alternates,
  should_accept_as_valid: [
    // Exhaustive for all combos of 2 alternates
    aa,
    abc,
    adef,
    bca,
    bcbc,
    bcdef,
    defa,
    defbc,
    defdef,
    // Non-exhaustive for combos of 3 alternates
    aaa,
    aabc,
    aadef,
    abca,
    adefa,
    bcbcbc,
    bcdefbc,
    bcdefa,
    defdefdef,
    defbca,
  ],
  should_reject_as_invalid: [
    '',
    a,
    bc,
    def,
    aaaa,
    aaabc,
    aaadef,
    abcabc,
    bcbcbcbc,
    defdefdefdef,
    abc0def,
    acbfed,
  ]
}

// Character Classes

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
    "\\ ",
  ],
  should_reject_as_invalid: [
    "a",
    ".",
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
    "a",
    ".",
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
    "a",
    ".",
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
    " ",
  ],
  should_reject_as_invalid: [
    "a",
    "A",
    "z",
    "Z",
    "0",
    "9",
    "_",
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
    " ",
  ]
}

type::{
  name: regex_character_class_compound,
  regex: "[abc0-3def4-6ghi]",
}
$test::{
  type: regex_character_class_compound,
  should_accept_as_valid: [
    a,
    b,
    c,
    d,
    e,
    f,
    g,
    h,
    i,
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ],
  should_reject_as_invalid: [
    j,
    k,
    l,
    "7",
    "8",
    "9",
  ]
}

type::{
  name: regex_character_class_compound_negated,
  regex: "[^a-c123w-z]",
}
$test::{
  type: regex_character_class_compound_negated,
  should_accept_as_valid: [
    "d",
    "e",
    "f",
    p,
    q,
    r,
    s,
    "0",
    "4",
    "5",
  ],
  should_reject_as_invalid: [
    "a",
    "b",
    "c",
    w,
    x,
    y,
    z,
    "1",
    "2",
    "3",
  ]
}

type::{
  name: regex_character_class_unioned_with_d_metachar_class,
  regex: "[a-f\\d]",
}
$test::{
  type: regex_character_class_unioned_with_d_metachar_class,
  should_accept_as_valid: [
    a,
    b,
    c,
    d,
    e,
    f,
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
    g,
    h,
    i,
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
    "\0",
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
    "\0",
  ],
  should_reject_as_invalid: [
    "\f",
    "\n",
    "\r",
    "\t",
  ]
}
