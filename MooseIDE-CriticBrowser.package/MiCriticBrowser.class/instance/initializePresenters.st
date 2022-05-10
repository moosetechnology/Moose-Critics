accessing
initializePresenters
	
	super initializePresenters.
	self initializeLists.
	self initializeButtons.
	
	rulesMakerPresenter := self instantiate: MiCriticBrowserRulesMakerPresenter on: model.
	rulesMakerPresenter mainWindow: self.
	
	self focusOrder
			add: queries;
			add: queryResult;
			add: inspectButton;
			add: openRulesMakerButton;
			add: runButton.