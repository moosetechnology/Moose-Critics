buttons actions
codeButtonAction
	changeableBlock 
		removeAll;
		add: ('Input for code query :' asPresenter) expand: false;
		add: codePresenter.
	codeInput text: '[ :entity | ]'.
	addButton action: [ 
		codeInput text ifNotNil: 
		[ mainWindow model addQuery: ((MiCriticBrowserPharoCodeQuery on: (codeInput text)) name: (ruleTitle text); yourself) ].
		ruleTitle text: ''.
		codeInput text: '[ :entity | ]'.
		mainWindow updateQueriesList ]