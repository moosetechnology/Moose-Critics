instance creation
named: aString on: aQuery
	^ self new
		name: aString;
		query: aQuery;
		yourself