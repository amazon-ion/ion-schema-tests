invalid_type::{ regex: null }
invalid_type::{ regex: null.string }
invalid_type::{ regex: 5 }
invalid_type::{ regex: [] }
invalid_type::{ regex: () }
invalid_type::{ regex: {} }

// backreferences are not allowed
invalid_type::{ regex: "\\1" }

// POSIX character classes are not allowed
invalid_type::{ regex: "\\p{Lower}" }

// invalid escaped character
invalid_type::{ regex: "\\A" }
invalid_type::{ regex: "\\b" }
invalid_type::{ regex: "\\B" }
invalid_type::{ regex: "\\c" }
invalid_type::{ regex: "\\e" }
invalid_type::{ regex: "\\E" }
invalid_type::{ regex: "\\G" }
invalid_type::{ regex: "\\h" }
invalid_type::{ regex: "\\H" }
invalid_type::{ regex: "\\R" }
invalid_type::{ regex: "\\v" }
invalid_type::{ regex: "\\V" }
invalid_type::{ regex: "\\Q" }
invalid_type::{ regex: "\\Z" }
invalid_type::{ regex: "\\z" }

// invalid character classes/ranges
invalid_type::{ regex: "[a-d[m-p]]" }
invalid_type::{ regex: "[a-z&&[def]]" }
invalid_type::{ regex: "[\\p{L}]" }

// reluctant quantifiers are not allowed
invalid_type::{ regex: "abc??" }
invalid_type::{ regex: "abc*?" }
invalid_type::{ regex: "abc+?" }
invalid_type::{ regex: "abc{1}?" }
invalid_type::{ regex: "abc{1,}?" }
invalid_type::{ regex: "abc{1,2}?" }

// possessive quantifiers are not allowed
invalid_type::{ regex: "abc?+" }
invalid_type::{ regex: "abc*+" }
invalid_type::{ regex: "abc++" }
invalid_type::{ regex: "abc{1}+" }
invalid_type::{ regex: "abc{1,}+" }
invalid_type::{ regex: "abc{1,2}+" }

// special constructs with prefix "(?" are not allowed
invalid_type::{ regex: "(?" }

