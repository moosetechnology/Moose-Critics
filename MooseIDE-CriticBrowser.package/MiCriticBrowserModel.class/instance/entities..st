accessing
entities: aGroupOfEntities
	
	entities removeAll.
	aGroupOfEntities isCollection ifTrue: [ entities := aGroupOfEntities ] ifFalse: [ entities add: aGroupOfEntities ].
	entities sort: [ :a :b | a name < b name ]