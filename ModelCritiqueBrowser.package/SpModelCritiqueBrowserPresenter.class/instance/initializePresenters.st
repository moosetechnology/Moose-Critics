accessing
initializePresenters

	critiquesToolbar := self instantiate: SpModelCritiqueBrowserCritiqueToolbar on: self.
	entitiesToolbar := self instantiate: SpModelCritiqueBrowserEntitiesToolbar on: self.  

	critiques := self newTreeTable.
	invalidEntities := self newList.
	textArea := self newCode beNotEditable.
	
	critiques addColumn: (SpCompositeTableColumn new title: 'Rules Group').
	
	self focusOrder 
		add: critiques;
		add: critiquesToolbar;
		add: invalidEntities;
		add: textArea