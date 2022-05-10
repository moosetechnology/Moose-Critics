adding
addButtonAction
	codeButton state 
		ifTrue: [ self addInputtedCodeRule ] 
		ifFalse: [ self addInputtedFQRule ].
	ruleTitle text: ''.
	mainWindow updateQueriesList 