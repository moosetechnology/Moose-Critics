test
testSelectedQuery
	| entity1 entity2 query1 query2 group |
	entity1 := FamixStMethod new.
	entity2 := FamixStMethod new.
	entity1 name: 'test'. entity2 name: 'test'.
	entity1 isStub: true.
	group := MooseGroup new.
	group add: entity1; add: entity2.
	query1 := (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]'). 
	query2 := (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isDead ]').
	
	browser model setEntities: group.
	browser model addQuery: query1; addQuery: query2.
	browser model runQueries.
	browser updateQueriesList.
	
	browser queries selectItem: query1.
	self assert: browser queryResult items size equals: 1.
	self assert: browser queryResult items anyOne equals: entity1.
	
	browser queries selectItem: query2.
	self assert: browser queryResult items size equals: 2.
	self assertCollection: browser queryResult items includesAll: group.
	