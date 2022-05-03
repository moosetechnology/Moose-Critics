accessing
initializePresenters
	
	super initializePresenters.
	
	queryMakerPresenter := self instantiate: MiCriticBrowserQueryMakerPresenter on: model. 

	openQueryMakerButton := self newButton.
	runButton := self newButton.
	queries := self newTree.
	queryResult := self newList.
	inspectButton := self newButton.
	
	openQueryMakerButton label: 'Add queries';
				 icon: (self iconNamed: #smallAdd);
				 action: [ self openQueryMakerButtonAction ].
	
	runButton label: 'Run';
				 icon: (self iconNamed: #glamorousPlay);
				 action: [ self runButtonAction ].
	
	queries items: self model queries;
				beMultipleSelection;
				display: [ :each | self displayQuery: each ];
				whenSelectionChangedDo: [ self selectedQueries ].
	
	queryResult display: [ :each | each name ];
					sortingBlock: [ :a :b | a name < b name ];
					activateOnDoubleClick;
					whenActivatedDo: [ :each | each selectedItem inspect ].
	
	inspectButton 
		label: 'Inspect model';
		icon: (self iconNamed: #glamorousInspect);
		action: [ self model entities inspect ].
	
	self focusOrder
			add: inspectButton;
			add: runButton;
			add: queries;
			add: queryResult.