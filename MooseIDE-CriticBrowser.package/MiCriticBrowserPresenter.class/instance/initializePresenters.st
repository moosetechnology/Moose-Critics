accessing
initializePresenters
	
	super initializePresenters.

	critiques := self newTreeTable.
	invalidEntities := self newList.
	textArea := self newCode beNotEditable.
	
	critiques addColumn: (SpStringTableColumn new title: 'Entities';
																evaluated: #name ).
				
	self focusOrder 
		add: critiques;
		add: invalidEntities;
		add: textArea