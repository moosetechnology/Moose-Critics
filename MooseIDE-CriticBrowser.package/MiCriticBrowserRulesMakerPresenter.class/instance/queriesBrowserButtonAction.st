buttons actions
queriesBrowserButtonAction
	changeableBlock 
		removeAll; 
		add: ('Choose a query :' asPresenter) expand: false;
		add: queriesBrowserPresenter.
	addButton action: [ 
		queryDroplist selectedItem ifNotNil: 
		[ mainWindow model addQuery: ((MiCriticBrowserFQQuery on: (queryDroplist selectedItem)) name: (ruleTitle text); yourself) ].
		ruleTitle text: ''.
		mainWindow updateQueriesList 
	]