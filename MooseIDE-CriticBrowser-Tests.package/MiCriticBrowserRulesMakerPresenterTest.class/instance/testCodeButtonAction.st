test
testCodeButtonAction
	browser openRulesMakerButton performAction.
	rulesMaker codeButtonAction.
	self assert: rulesMaker codeInput isVisible equals: true.
	self assert: rulesMaker queryDroplist isVisible equals: false