accessing
setOutput: aMooseObject
	
	aMooseObject isCollection
		ifTrue: [ output := aMooseObject ]
		ifFalse: [ output := {aMooseObject} asMooseGroup ].