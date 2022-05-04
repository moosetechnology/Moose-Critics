buttons actions
queriesBrowserButtonAction
	changeableBlock 
		removeAll; 
		add: queriesBrowserPresenter.
	addButton action: [ 
		queryDroplist selectedItem ifNotNil: 
		[ mainWindow model addQuery: (MiCriticBrowserFQQuery on: (queryDroplist selectedItem)) ].
		mainWindow updateQueriesList 
	]