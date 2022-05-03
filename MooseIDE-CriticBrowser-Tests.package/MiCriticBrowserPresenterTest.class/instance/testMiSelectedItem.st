test
testMiSelectedItem

	| entity entityStub |
	entity := MooseEntity new.
	entityStub := MooseEntity new.
	entityStub isStub: true.
	
	"propagating the entity for the model to receive it"
	(browser model) 
		setEntities: {entity. entityStub}; 
		addQuery: (MiCriticBrowserFQQuery on: (FQBooleanQuery property: #isStub));
		runQueries.
		
	self assert: browser miSelectedItem size equals: 1.
	self assert: (browser miSelectedItem at:1) equals: entityStub 