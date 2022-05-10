adding
addInputtedCodeRule
	codeInput text ifNotNil: 
		[ mainWindow model addRule: (MiCBRule named: (ruleTitle text) on: (MiCriticBrowserPharoCodeQuery on: (codeInput text))) ].
	codeInput text: '[ :entity | ]'