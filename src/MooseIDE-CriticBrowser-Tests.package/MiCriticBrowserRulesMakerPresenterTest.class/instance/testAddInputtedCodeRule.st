test
testAddInputtedCodeRule
	rulesMaker codeButtonAction.
	rulesMaker codeInput text: '[ :entity | entity isDead ]'.
	rulesMaker addButton performAction.
	
	self assert: browser model rules size equals: 1