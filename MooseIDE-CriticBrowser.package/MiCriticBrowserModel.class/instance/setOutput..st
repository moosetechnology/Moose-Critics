accessing
setOutput: aMooseObject
	
	output removeAll.
	aMooseObject isCollection
		ifTrue: [ output := aMooseObject ]
		ifFalse: [ output add: aMooseObject ].