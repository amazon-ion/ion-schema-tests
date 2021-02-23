type::{
	     timestamp_offset: not::["-00:00"],
	     type: $any,
	 }

	 test_validation::{
	     value: 2000-01-01T00:00:00-00:00,
	     violations: [
	         { constraint: { timestamp_offset: not::["-00:00"] }, code: invalid_timestamp_offset },
	     ],
	 }
