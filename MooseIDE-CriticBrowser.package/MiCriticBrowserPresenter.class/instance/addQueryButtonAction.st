adding
addQueryButtonAction
	queryDroplist selectedItem ifNotNil: [ model addQuery: (MiCriticBrowserFQQuery on: (queryDroplist selectedItem)) ].
	self updateQueriesList