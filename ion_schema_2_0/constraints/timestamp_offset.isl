$ion_schema_2_0

type::{
  name: 'timestamp_offset: ["+02:43"]',
  timestamp_offset: ["+02:43"],
}

$test::{
  type: 'timestamp_offset: ["+02:43"]',
  should_accept_as_valid:[
    2000-01-01T00:00+02:43,
    2000-01-01T00:00:00+02:43,
    2000-01-01T00:00:00.000+02:43,
  ],
  should_reject_as_invalid:[
    null,
    null.timestamp,
    "+2:43",
    2000-01-01T00:00+03:43,
    2000-01-01T00:00+02:44,
    2000-01-01T00:00-02:43,
    2000-01-01T,
  ]
}

type::{
  name: timestamp_offset_with_repeated_offset,
  timestamp_offset: ["+01:11", "+01:11"],
}
$test::{
  type: timestamp_offset_with_repeated_offset,
  should_accept_as_valid:[
    2000-01-01T00:00+01:11,
    2000-01-01T00:00:00+01:11,
    2000-01-01T00:00:00.000+01:11,
  ],
  should_reject_as_invalid:[
    null,
    null.timestamp,
    "+1:11",
    2000-01-01T00:00-01:11,
    2000-01-01T,
  ]
}

type::{
  name: 'timestamp_offset: ["-00:00"]',
  timestamp_offset: ["-00:00"],
}

$test::{
  type: 'timestamp_offset: ["-00:00"]',
  should_accept_as_valid:[
    2000T,
    2001-02-03T,
    2001-02-03T04:05:06-00:00,
  ],
  should_reject_as_invalid:[
    null,
    null.timestamp,
    2000-01-01T00:00+03:00,
    2000-01-01T00:00+00:00,
    2000-01-01T00:00-01:00,
  ]
}

type::{
  name: 'timestamp_offset: ["+00:00"]',
  timestamp_offset: ["+00:00"],
}

$test::{
  type: 'timestamp_offset: ["+00:00"]',
  should_accept_as_valid:[
    2000-01-01T00:00+00:00,
    2000-01-01T12:34:56.789Z,
  ],
  should_reject_as_invalid:[
    null,
    null.timestamp,
    2000-01-01T00:00+03:00,
    2000-01-01T00:00-01:00,
    2000T,
    2001-02-03T,
    2001-02-03T04:05:06-00:00,
  ]
}

type::{
  name: 'timestamp_offset: ["+01:23", "-02:34"]',
  timestamp_offset: ["+01:23", "-02:34"],
}

$test::{
  type: 'timestamp_offset: ["+01:23", "-02:34"]',
  should_accept_as_valid:[
    2000-01-01T00:00+01:23,
    2000-01-01T12:34:56.789-02:34,
  ],
  should_reject_as_invalid:[
    null,
    null.timestamp,
    2000-01-01T00:00+02:34,
    2000-01-01T00:00Z,
    2000T,
    2001-02-03T,
    2001-02-03T04:05:06-01:23,
  ]
}

$test::{
  description: "timestamp_offset must only be a list of offset strings",
  invalid_types:[
    { timestamp_offset: null },
    { timestamp_offset: null.list },
    { timestamp_offset: null.string },
    { timestamp_offset: []},
    { timestamp_offset: range::["+00:00", "+12:00"] },
    { timestamp_offset: [foo::"+00:00"] },
    { timestamp_offset: ("+00:00") },
    { timestamp_offset: "+00:00" },
    { timestamp_offset: ["Z"] },
    { timestamp_offset: () },
    { timestamp_offset: {} },
    { timestamp_offset: foo },
    { timestamp_offset: 1 },
    { timestamp_offset: ["+00:00:00"] },
    { timestamp_offset: ["+06:15.30"] },
    { timestamp_offset: ["+1:23"] },
    { timestamp_offset: ["+12.34"] },
    { timestamp_offset: ["+012:34"] },
    { timestamp_offset: ["*12:34"] },
    { timestamp_offset: ["12:34"] },
    { timestamp_offset: ["+24:00"] },
    { timestamp_offset: ["+00:60"] },
    { timestamp_offset: ['+08:00'] },
    { timestamp_offset: ["+00:-30"] },
    { timestamp_offset: [null.string] },
    { timestamp_offset: [2022-09-25T00:00+08:00] },
  ]
}
