test
testChildrenFor
	| entity |
	entity := FamixStMethod new.
	entity name: 'test'; isStub: true.
	browser model 
		setEntities: entity;
		addQuery: (MiCriticBrowserFQQuery on: (FQBooleanQuery property: #isStub));
		runQueries.
	
	browser updateResultList: browser model getCompleteOutput.
	self assertCollection: (browser children: (browser queryResult roots anyOne) for: (browser queryResult)) includesAll: { entity }