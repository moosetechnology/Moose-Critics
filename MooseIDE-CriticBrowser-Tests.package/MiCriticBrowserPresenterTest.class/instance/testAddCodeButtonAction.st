tests
testAddCodeButtonAction
	browser queryInput text: 'entity isDead'.
	browser addCodeButton performAction.
	
	self assert: browser model queries size equals: 1