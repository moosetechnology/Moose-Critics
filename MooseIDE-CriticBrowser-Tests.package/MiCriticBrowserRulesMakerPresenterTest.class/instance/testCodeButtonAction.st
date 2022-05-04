test
testCodeButtonAction
	browser openRulesMakerButton performAction.
	rulesMaker codeButtonAction.
	rulesMaker codeInput text: '[ :entity | entity isDead ]'.
	rulesMaker addButton performAction.
	rulesMaker delete.
	
	self assert: browser model queries size equals: 1.