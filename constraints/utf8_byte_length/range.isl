 type::{
   utf8_byte_length: range::[5, 10],
 }
 valid::[
   '12345',
   "1234567890",
   "\u00A2\u20AC",
   '\u20AC\u20AC'

 ]
 invalid::[
   '1234',
   "12345678901",
   '\u00A2\u00A2'
 ]