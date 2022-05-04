accessing
initializePresenters
	
	super initializePresenters.
	self initializeLists.
	self initializeButtons.
	
	queryMakerPresenter := self instantiate: MiCriticBrowserQueryMakerPresenter on: model.
	queryMakerPresenter mainWindow: self.
	
	self focusOrder
			add: queries;
			add: queryResult;
			add: inspectButton;
			add: openQueryMakerButton;
			add: runButton.