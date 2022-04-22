accessing
initializePresenters
	
	super initializePresenters.

	entities := self newTreeTable.
	queryResult := self newList.
	textArea := self newCode beNotEditable.
	
	entities addColumn: (SpStringTableColumn new title: 'Entities';
																evaluated: #name ); roots: self model entities asOrderedCollection.
	self focusOrder
			add: entities;
			add: queryResult;
			add: textArea