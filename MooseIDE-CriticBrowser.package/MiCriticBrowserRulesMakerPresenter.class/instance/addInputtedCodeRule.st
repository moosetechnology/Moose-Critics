adding
addInputtedCodeRule
	codeInput text ifNotNil: 
		[ mainWindow model addQuery: ((MiCriticBrowserPharoCodeQuery on: (codeInput text)) name: (ruleTitle text); yourself) ].
	codeInput text: '[ :entity | ]'