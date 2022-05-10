tests
testUnselectPrintsCompleteOutput
	browser model setEntities: { stubEntity. basicEntity } asMooseGroup.
	browser model addRule: stubRule; addRule: deadRule.
	browser runButtonAction.
	
	browser queries selectItem: stubRule.
	browser queries unselectAll.
	self assert: (browser queryResult roots flatten size) equals: 2
