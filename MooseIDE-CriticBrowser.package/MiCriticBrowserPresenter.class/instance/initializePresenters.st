accessing
initializePresenters
	
	super initializePresenters.

	queryInput := self newCode.
	runButton := self newButton.
	entities := self newTreeTable.
	queryResult := self newList.
	textArea := self newCode beNotEditable.
	
	runButton label: 'Run';
				 icon: (self iconNamed: #glamorousPlay);
				 action: [self model queries: (MiCriticBrowserPharoCodeQuery on: (queryInput text))].
	
	entities addColumn: (SpStringTableColumn new title: 'Entities';
																evaluated: #name ); roots: self model entities asOrderedCollection.
	self focusOrder
			add: queryInput;
			add: runButton;
			add: entities;
			add: queryResult;
			add: textArea