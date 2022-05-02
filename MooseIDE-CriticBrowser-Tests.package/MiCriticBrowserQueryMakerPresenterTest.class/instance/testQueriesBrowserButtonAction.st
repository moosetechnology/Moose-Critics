test
testQueriesBrowserButtonAction
	| query |
	query := FQBooleanQuery property: #isStub.
	queryMaker queriesBrowserButtonAction.
	queryMaker queryDroplist items: { query }.
	queryMaker queryDroplist selectItem: query.
	queryMaker addButton performAction.
	
	self assert: browser model queries size equals: 1.