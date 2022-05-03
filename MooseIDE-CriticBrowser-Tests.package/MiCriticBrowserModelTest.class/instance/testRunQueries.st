tests
testRunQueries
	| entity1 entity2 query1 query2 group |
	entity1 := FamixStMethod new.
	entity2 := FamixStMethod new.
	entity1 isStub: true.
	group := MooseGroup new.
	group add: entity1; add: entity2.
	query1 := (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]'). 
	query2 := (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isDead ]').
	
	model setEntities: group.
	model addQuery: query1; addQuery: query2.
	model runQueries.
	self assert: model output size equals: 2.
	self assertCollection: (model output at: query1) includesAll: {entity1}.
	self assertCollection: (model output at: query2) includesAll: group.
	