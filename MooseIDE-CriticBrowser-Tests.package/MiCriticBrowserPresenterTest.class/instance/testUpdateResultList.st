test
testUpdateResultList

	| entity |
	entity := FamixStMethod new.
	entity name: 'test'; isStub: true.
	browser model 
		setEntities: entity;
		addQuery: (MiCriticBrowserFQQuery on: (FQBooleanQuery property: #isStub));
		runQueries.
	
	browser updateResultList: browser model getCompleteOutput.
	self assert: (browser queryResult roots flatten size) equals: 1