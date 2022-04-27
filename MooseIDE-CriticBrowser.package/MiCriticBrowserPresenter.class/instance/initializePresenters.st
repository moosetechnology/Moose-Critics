accessing
initializePresenters
	
	super initializePresenters.

	queryInput := self newCode.
	addButton := self newButton.
	runButton := self newButton.
	queries := self newTreeTable.
	queryResult := self newList.
	textArea := self newCode beNotEditable. 
	queryDroplist := self newDropList.
	inspectButton := self newButton.
	
	addButton label: 'Add query';
				 icon: (self iconNamed: #smallAdd);
				 action: [ self addButtonAction ].
	
	runButton label: 'Run';
				 icon: (self iconNamed: #glamorousPlay);
				 action: [ self runButtonAction ].
	
	queries addColumn: (SpStringTableColumn new title: 'Queries';
				evaluated: #query ); roots: self model queries;
				activateOnDoubleClick;
				whenActivatedDo: [ :each | each selectedItem inspect ].
	
	queryResult display: [ :each | each name ];
					activateOnDoubleClick;
					whenActivatedDo: [ :each | each selectedItem inspect ].
	
	queryDroplist startWithoutSelection;
		           items: self fetchQueries.
	
	inspectButton 
		label: 'Inspect model';
		icon: (self iconNamed: #glamorousInspect);
		action: [ self model entities inspect ] .		
	
	self focusOrder
			add: inspectButton;
			add: queryInput;
			add: runButton;
			add: queries;
			add: queryResult;
			add: textArea