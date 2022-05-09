adding
addInputtedFQRule
	queryDroplist selectedItem ifNotNil: 
		[ mainWindow model addQuery: ((MiCriticBrowserFQQuery on: (queryDroplist selectedItem)) name: (ruleTitle text); yourself) ]