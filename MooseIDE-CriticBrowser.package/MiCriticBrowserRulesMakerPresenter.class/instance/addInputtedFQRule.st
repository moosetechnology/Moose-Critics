adding
addInputtedFQRule
	queryDroplist selectedItem ifNotNil: 
		[ mainWindow model addRule: (MiCBRule named: (ruleTitle text) on: (MiCriticBrowserFQQuery on: (queryDroplist selectedItem))) ]