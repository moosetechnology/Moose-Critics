test
testAddInputtedFQRule
	| query |
	query := FQBooleanQuery property: #isStub.
	rulesMaker queriesBrowserButton click.
	rulesMaker queryDroplist items: { query }.
	rulesMaker queryDroplist selectItem: query.
	rulesMaker addButton performAction.
	
	self assert: browser model rules size equals: 1.