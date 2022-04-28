accessing
setEntities: aMooseObject
	
	aMooseObject isCollection
		ifTrue: [ entities := aMooseObject ]
		ifFalse: [ entities := {aMooseObject} asMooseGroup ].