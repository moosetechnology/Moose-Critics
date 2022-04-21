accessing
initializePresenters
	
	super initializePresenters.
	
	critiquesToolbar := self instantiate: SpModelCritiqueBrowserCritiqueToolbar on: self.
	entitiesToolbar := self instantiate: SpModelCritiqueBrowserEntitiesToolbar on: self.  

	critiques := self newTreeTable.
	invalidEntities := self newList.
	textArea := self newCode beNotEditable.
	
	critiques addColumn: (SpStringTableColumn new title: 'Entities';
																	evaluated: #name );
				 roots: {model allAccesses}, {model allModelClasses} ;
				 children: [ :each | (each isCollection) ifTrue: [ each asCollection sorted: [ :a :b | (a name) <= (b name) ] ] ifFalse: [ { } ] ].
				
	self focusOrder 
		add: critiques;
		add: critiquesToolbar;
		add: invalidEntities;
		add: textArea