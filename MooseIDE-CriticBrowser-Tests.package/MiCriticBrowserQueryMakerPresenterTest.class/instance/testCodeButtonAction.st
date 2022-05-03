test
testCodeButtonAction.
	browser openQueryMakerButtonAction.
	queryMaker codeButtonAction.
	queryMaker codeInput text: '[ :entity | entity isDead ]'.
	queryMaker addButton performAction.
	
	self assert: browser model queries size equals: 1.