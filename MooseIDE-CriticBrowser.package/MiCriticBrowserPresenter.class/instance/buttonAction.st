as yet unclassified
buttonAction
	self model queries: (MiCriticBrowserPharoCodeQuery on: (queryInput text)).
	self model output: (self model queries runOn: (self model entities)).
	self updateResultList