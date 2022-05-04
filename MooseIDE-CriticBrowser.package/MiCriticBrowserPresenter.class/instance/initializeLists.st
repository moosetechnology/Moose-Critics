initialization
initializeLists
	queries := self newTree.
	queryResult := self newTree.
	
	queries
		items: self model queries;
		beMultipleSelection;
		display: [ :each | self displayQuery: each ];
		whenSelectionChangedDo: [ self selectedQueries ].
	
	queryResult
		display: [ :each | self stringForItem: each ];
		children: 
			[ :each | (queryResult roots includes: each) 
				ifTrue: [ (queryResult roots at: (queryResult roots indexOf: each)) asCollection ] 
				ifFalse: [ {  } ] ];
		activateOnDoubleClick;
		whenActivatedDo: [ :each | each selectedItem inspect ]