test
testAddInputtedCodeRule
	rulesMaker codeButtonAction.
	rulesMaker codeInput text: '[ :entity | entity isDead ]'.
	rulesMaker addButton performAction.
	
	self assert: browser model queries size equals: 1