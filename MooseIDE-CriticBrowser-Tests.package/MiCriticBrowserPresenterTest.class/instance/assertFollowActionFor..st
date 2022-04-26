asserting
assertFollowActionFor: aMooseObject

	aMooseObject isCollection 
		ifTrue: [ self assertCollection: browser model entities includesAll: aMooseObject.
					 self assert: browser model entities class equals: aMooseObject class ]
		ifFalse: [ self assert: (browser model entities at: 1) equals: aMooseObject ]
						