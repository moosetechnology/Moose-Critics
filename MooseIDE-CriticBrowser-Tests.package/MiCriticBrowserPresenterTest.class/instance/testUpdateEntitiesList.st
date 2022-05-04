test
testUpdateEntitiesList
	| entity |
	entity := FamixStMethod new.
	entity name: 'test'; isStub: true.
	browser model 
		setEntities: entity.
	
	browser updateEntitiesList.
	self assert: (browser entitiesList roots flatten size) equals: 1