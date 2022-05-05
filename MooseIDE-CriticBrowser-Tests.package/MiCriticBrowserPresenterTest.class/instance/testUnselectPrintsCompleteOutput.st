tests
testUnselectPrintsCompleteOutput
	| entity1 entity2 query1 query2 group |
	entity1 := FamixStMethod new.
	entity2 := FamixStMethod new.
	entity1 name: 'test'. entity2 name: 'test'.
	entity1 isStub: true.
	group := MooseGroup new.
	group add: entity1; add: entity2.
	query1 := ((MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]') name: 'Test'). 
	query2 := ((MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isDead ]') name: 'Test').
	
	browser model setEntities: group.
	browser model addQuery: query1; addQuery: query2.
	browser runButtonAction.
	
	browser queries selectItem: query1.
	browser queries unselectAll.
	self assert: (browser queryResult roots flatten size) equals: 2
