adding
addCodeButtonAction
	self model addQuery: (MiCriticBrowserPharoCodeQuery on: (queryInput text)).
	queryInput text: ''.
	self updateQueriesList