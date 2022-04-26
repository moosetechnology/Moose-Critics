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
				 action: [ self buttonAction ].
	
	entities addColumn: (SpStringTableColumn new title: 'Entities';
																evaluated: #name ); roots: self model entities asOrderedCollection.
	
	queryResult display: [ :each | each name ].
	
	self focusOrder
			add: queryInput;
			add: runButton;
			add: entities;
			add: queryResult;
			add: textArea