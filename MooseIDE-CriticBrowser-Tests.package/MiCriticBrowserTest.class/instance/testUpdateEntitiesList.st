test
testUpdateEntitiesList
	browser model setEntities: stubEntity.
	
	browser updateEntitiesList.
	self assert: (browser entitiesList roots flatten size) equals: 1