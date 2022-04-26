as yet unclassified
buttonAction
	self model setQueries: (MiCriticBrowserPharoCodeQuery on: (queryInput text)).
	self model setOutput: (self model queries runOn: (self model entities)).
	self updateResultList