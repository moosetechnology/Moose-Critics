tests
testRunQueries
	| entity1 entity2 group |
	entity1 := FamixStMethod new.
	entity2 := FamixStMethod new.
	entity1 isStub: true; name: 'pas test'.
	entity2 name: 'test'.
	group := MooseGroup new.
	group add: entity1; add: entity2.
	
	model setEntities: group.
	model addQuery: (MiCriticBrowserPharoCodeQuery on: 'entity isStub').
	model runQueries.
	self assert: model output size equals: 1.
	
	model addQuery: (MiCriticBrowserPharoCodeQuery on: 'entity name = ''test'' ').
	model runQueries.
	self assert: model output size equals: 2.
	
	model addQuery: (MiCriticBrowserPharoCodeQuery on: 'entity isDead').
	model runQueries.
	self assert: model output size equals: 2