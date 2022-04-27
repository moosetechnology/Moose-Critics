accessing
setEntities: aMooseObject
	
	entities removeAll.
	aMooseObject isCollection
		ifTrue: [ entities := aMooseObject copy ]
		ifFalse: [ entities add: aMooseObject ].
	entities sort: [ :a :b | a name < b name ]