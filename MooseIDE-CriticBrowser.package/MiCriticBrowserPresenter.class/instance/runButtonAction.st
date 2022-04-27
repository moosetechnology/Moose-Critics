buttons actions
runButtonAction
	self model setQueries: (MiCriticBrowserPharoCodeQuery on: (queryInput text)).
	self model runQueries.
	self updateResultList.
	self updateToolbar