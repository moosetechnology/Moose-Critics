test
testAddQueryButtonAction
	| query |
	query := MiCriticBrowserFQQuery on: (FQBooleanQuery property: #isStub).
	browser queryDroplist items: { query }.
	browser queryDroplist selectItem: query.
	browser addQueryButton performAction.
	
	self assert: (browser model queries size) equals: 1