accessing
initializePresenters
	
	super initializePresenters.
	self initializeLists.
	self initializeButtons.
	
	queryMakerPresenter := self instantiate: MiCriticBrowserQueryMakerPresenter on: model.
	
	self focusOrder
			add: queries;
			add: queryResult;
			add: inspectButton;
			add: openQueryMakerButton;
			add: runButton.