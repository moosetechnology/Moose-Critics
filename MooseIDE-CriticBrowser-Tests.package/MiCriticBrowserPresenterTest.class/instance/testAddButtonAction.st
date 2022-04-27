tests
testAddButtonAction
	browser queryInput text: 'entity isDead'.
	browser addButton performAction.
	
	self assert: browser model queries size equals: 1