test
testUpdateResultList

	| entity |
	entity := MooseEntity new.
	browser model 
		setEntities: entity;
		addQuery: (MiCriticBrowserFQQuery on: (FQBooleanQuery property: #isDead));
		runQueries.
	
	browser updateResultList: browser model output.
	self assert: (browser queryResult items size) equals: 1