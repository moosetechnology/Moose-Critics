buttons actions
codeButtonAction
	changeableBlock 
		removeAll; 
		add: codePresenter.
	addButton action: [ 
		codeInput text ifNotNil: 
		[ owner model addQuery: (MiCriticBrowserPharoCodeQuery on: (codeInput text)) ].
		codeInput text: '[ :entity | ]'.
		owner updateQueriesList ]