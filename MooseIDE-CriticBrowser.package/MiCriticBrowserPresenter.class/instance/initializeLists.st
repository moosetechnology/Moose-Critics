initialization
initializeLists
	queries := self newTree.
	queryResult := self newList.
	
	queries
		items: self model queries;
		beMultipleSelection;
		display: [ :each | self displayQuery: each ];
		whenSelectionChangedDo: [ self selectedQueries ].
	
	queryResult
		display: [ :each | each name ];
		sortingBlock: [ :a :b | a name < b name ];
		activateOnDoubleClick;
		whenActivatedDo: [ :each | each selectedItem inspect ]