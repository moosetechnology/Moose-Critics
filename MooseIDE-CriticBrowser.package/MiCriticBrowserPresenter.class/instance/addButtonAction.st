adding
addButtonAction
	self model addQuery: (MiCriticBrowserPharoCodeQuery on: (queryInput text)).
	self updateQueriesList