test
testAddInputtedFQRule
	| query |
	query := FQBooleanQuery property: #isStub.
	browser openRulesMakerButton performAction.
	rulesMaker queriesBrowserButton click.
	rulesMaker queryDroplist items: { query }.
	rulesMaker queryDroplist selectItem: query.
	rulesMaker addButton performAction.
	rulesMaker delete.
	
	self assert: browser model queries size equals: 1.