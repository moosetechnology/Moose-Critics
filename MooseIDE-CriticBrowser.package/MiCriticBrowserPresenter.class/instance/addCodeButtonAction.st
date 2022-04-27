adding
addCodeButtonAction
	self model addQuery: (MiCriticBrowserPharoCodeQuery on: (queryInput text)).
	self updateQueriesList