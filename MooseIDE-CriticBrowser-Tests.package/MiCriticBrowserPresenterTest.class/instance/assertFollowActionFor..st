asserting
assertFollowActionFor: aMooseObject

	aMooseObject isCollection 
		ifTrue: [ self assert: browser model entities equals: aMooseObject ]
		ifFalse: [ self assert: (browser model entities at: 1) equals: aMooseObject ]
						