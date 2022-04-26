accessing
setOutput: aMooseObject
	
	output removeAll.
	(aMooseObject isMooseObject and: (aMooseObject isCollection)) 
		ifTrue: [ output := aMooseObject ]
		ifFalse: [ output add: aMooseObject ].