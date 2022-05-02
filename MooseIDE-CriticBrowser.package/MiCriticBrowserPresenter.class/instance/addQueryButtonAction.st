adding
addQueryButtonAction
	queryMakerPresenter queryDroplist selectedItem ifNotNil: [ model addQuery: (MiCriticBrowserFQQuery on: (queryMakerPresenter queryDroplist selectedItem)) ].
	self updateQueriesList