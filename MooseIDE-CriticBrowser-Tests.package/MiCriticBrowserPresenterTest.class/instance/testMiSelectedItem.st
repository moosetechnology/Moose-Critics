test
testMiSelectedItem

	| entity entityStub |
	entity := FamixStMethod new.
	entityStub := FamixStMethod new.
	entity name: 'test'. entityStub name: 'test'.
	entityStub isStub: true.
	
	"propagating the entity for the model to receive it"
	(browser model) 
		setEntities: {entity. entityStub} asMooseGroup; 
		addQuery: (MiCriticBrowserFQQuery on: (FQBooleanQuery property: #isStub));
		runQueries.
	browser updateResultList: browser model getCompleteOutput.
		
	self assert: browser miSelectedItem size equals: 1.
	self assert: (browser miSelectedItem at:1) equals: entityStub 