test
testQueriesBrowserButtonAction
	browser openRulesMakerButton performAction.
	rulesMaker queriesBrowserButtonAction.
	self assert: rulesMaker codeInput isVisible equals: false.
	self assert: rulesMaker queryDroplist isVisible equals: true