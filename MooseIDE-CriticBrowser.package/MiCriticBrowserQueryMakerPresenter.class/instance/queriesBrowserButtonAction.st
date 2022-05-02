as yet unclassified
queriesBrowserButtonAction
	changeableBlock 
		removeAll; 
		add: queriesBrowserPresenter.
	addButton action: [ 
		queryDroplist selectedItem ifNotNil: 
		[ owner model addQuery: (MiCriticBrowserFQQuery on: (queryDroplist selectedItem)) ].
		owner updateQueriesList 
	]