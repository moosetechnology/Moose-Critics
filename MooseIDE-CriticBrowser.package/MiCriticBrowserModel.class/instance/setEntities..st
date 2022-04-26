accessing
setEntities: aMooseObject
	
	entities removeAll.
	(aMooseObject isMooseObject and: (aMooseObject isCollection)) 
		ifTrue: [ entities := aMooseObject copy ]
		ifFalse: [ entities add: aMooseObject ].
	entities sort: [ :a :b | a name < b name ]