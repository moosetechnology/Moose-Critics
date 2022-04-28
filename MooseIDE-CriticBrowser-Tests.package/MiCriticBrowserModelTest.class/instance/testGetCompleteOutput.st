test
testGetCompleteOutput
	| entity1 entity2 query1 query2 group |
	entity1 := FamixStMethod new.
	entity2 := FamixStMethod new.
	entity1 isStub: true.
	group := MooseGroup new.
	group add: entity1; add: entity2.
	query1 := (MiCriticBrowserPharoCodeQuery on: 'entity isStub'). 
	query2 := (MiCriticBrowserPharoCodeQuery on: 'entity isDead').
	
	model setEntities: group.
	model addQuery: query1; addQuery: query2.
	model runQueries.
	self assert: model getCompleteOutput class equals: MooseGroup.
	self assertCollection: model getCompleteOutput includesAll: group  
	