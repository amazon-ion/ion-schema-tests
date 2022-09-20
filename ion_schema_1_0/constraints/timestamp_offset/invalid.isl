$ion_schema_1_0
$test::{
  description: "timestamp_offset must be a list of timestamp offset strings",
  invalid_types: [
    { timestamp_offset: null },
    { timestamp_offset: null.string },
    { timestamp_offset: null.list },
    { timestamp_offset: 5 },
    { timestamp_offset: [] },
    { timestamp_offset: [5] },
    { timestamp_offset: [""] },
    { timestamp_offset: ["Z"] },
    { timestamp_offset: ["+0000"] },
    { timestamp_offset: ["00:00"] },
    { timestamp_offset: [" 00:00"] },
    { timestamp_offset: ["00:00 "] },
    { timestamp_offset: ["*00:00"] },
    { timestamp_offset: ["+24:00"] },
    { timestamp_offset: ["+00:60"] },
  ]
}
