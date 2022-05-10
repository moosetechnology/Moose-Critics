test
testRunButtonAction
	browser model setEntities: { stubEntity } asMooseGroup.
	browser model addRule: stubRule.
	browser runButton performAction.
	
	self assert: browser model output size equals: 1 
	