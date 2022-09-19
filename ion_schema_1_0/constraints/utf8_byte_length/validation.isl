 type::{
   utf8_byte_length: 5,
   type: $any,
 }

 test_validation::{
   value: null,
   violations: [
     { constraint: { utf8_byte_length: 5 }, code: invalid_type },
   ],
 }

 test_validation::{
   values: [null.string, null.symbol],
   violations: [
     { constraint: { utf8_byte_length: 5 }, code: null_value },
   ],
 }

 test_validation::{
   values: [abcd, abcdef],
   violations: [
     { constraint: { utf8_byte_length: 5 }, code: invalid_utf8_byte_length },
   ],
 }