accessing
initializePresenters
	
	super initializePresenters.

	queryInput := self newCode.
	addCodeButton := self newButton.
	addQueryButton := self newButton.
	runButton := self newButton.
	queries := self newTree.
	queryResult := self newList.
	textArea := self newCode beNotEditable. 
	queryDroplist := self newDropList.
	inspectButton := self newButton.
	unselectButton := self newButton.
	
	addCodeButton label: 'Add query';
				 icon: (self iconNamed: #smallAdd);
				 action: [ self addCodeButtonAction ].
				
	addQueryButton label: 'Add query';
				 icon: (self iconNamed: #smallAdd);
				 action: [ self addQueryButtonAction  ].
	
	runButton label: 'Run';
				 icon: (self iconNamed: #glamorousPlay);
				 action: [ self runButtonAction ].
	
	queries items: self model queries;
				beMultipleSelection;
				display: [ :each | each query ];
				whenMultiSelectionChangedDo: [ self selectedQueries ].
	
	queryResult display: [ :each | each name ];
					sortingBlock: [ :a :b | a name < b name ];
					activateOnDoubleClick;
					whenActivatedDo: [ :each | each selectedItem inspect ].
	
	queryDroplist startWithoutSelection;
		           items: self fetchQueries.
	
	inspectButton 
		label: 'Inspect model';
		icon: (self iconNamed: #glamorousInspect);
		action: [ self model entities inspect ].
	
	unselectButton
		label: 'Unselect query';
		icon: (self iconNamed: #smallUndo);
		action: [ queries unselectAll. model output isEmpty ifTrue: (self updateResultList: model getCompleteOutput) ].		
	
	self focusOrder
			add: inspectButton;
			add: queryInput;
			add: unselectButton;
			add: addCodeButton;
			add: runButton;
			add: queries;
			add: queryResult;
			add: textArea