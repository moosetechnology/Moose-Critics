buttons actions
codeButtonAction
	changeableBlock 
		removeAll; 
		add: codePresenter.
	addButton action: [ 
		codeInput text ifNotNil: 
		[ mainWindow model addQuery: (MiCriticBrowserPharoCodeQuery on: (codeInput text)) ].
		codeInput text: '[ :entity | ]'.
		mainWindow updateQueriesList ]