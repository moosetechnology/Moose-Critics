initialization
initializeLists
	entitiesList := self newTree.
	queries := self newTree.
	queryResult := self newTree.
	
	entitiesList 
		display: [ :each | self stringForItem: each ];
		children: [ :each | self children: each for: entitiesList ];
		activateOnDoubleClick;
		whenActivatedDo: [ :each | each selectedItem inspect ].
	
	queries
		items: self model queries;
		beMultipleSelection;
		display: [ :each | self displayQuery: each ];
		whenSelectionChangedDo: [ (model output) ifNotEmpty: [ self selectedQueries ] ].
	
	queryResult
		display: [ :each | self stringForItem: each ];
		children: [ :each | self children: each for: queryResult ];
		activateOnDoubleClick;
		whenActivatedDo: [ :each | each selectedItem inspect ]