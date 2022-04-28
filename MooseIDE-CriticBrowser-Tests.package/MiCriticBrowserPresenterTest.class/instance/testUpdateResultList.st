test
testUpdateResultList

	| entity |
	entity := MooseEntity new.
	browser model setOutput: entity.
	
	browser updateResultList: browser model output.
	self assert: (browser queryResult items size) equals: 1