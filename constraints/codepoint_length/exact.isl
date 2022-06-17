type::{
  codepoint_length: 5,
}
valid::[
  '12345',
  "12345",
  "1234\U00027546", // 5 codepoints; 6 code units
]
invalid::[
  '1234',
  "123456",
  "123\U00027546", // 4 codepoints; 5 code units
]
