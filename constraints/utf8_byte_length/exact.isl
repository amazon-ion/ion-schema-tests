 type::{
   utf8_byte_length: 5,
 }
 valid::[
   '12345',
   "12345",
   '\u00A2\u20AC'
 ]
 invalid::[
   '1234',
   '123456',
   '\u00A2\u00A2',
   '\u20AC\u20AC'
 ]