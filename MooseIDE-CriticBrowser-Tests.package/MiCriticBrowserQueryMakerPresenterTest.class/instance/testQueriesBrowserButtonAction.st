test
testQueriesBrowserButtonAction
	| query |
	query := FQBooleanQuery property: #isStub.
	browser openQueryMakerButtonAction.
	queryMaker queriesBrowserButton click.
	queryMaker queryDroplist items: { query }.
	queryMaker queryDroplist selectItem: query.
	queryMaker addButton performAction.
	queryMaker delete.
	
	self assert: browser model queries size equals: 1.