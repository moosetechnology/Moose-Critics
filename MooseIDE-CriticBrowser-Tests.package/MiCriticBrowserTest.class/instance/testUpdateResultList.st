test
testUpdateResultList
	browser model addRule: stubRule; setEntities: { stubEntity } asMooseGroup; runRules. 
	
	browser updateResultList: browser model getCompleteOutput.
	self assert: (browser queryResult roots flatten size) equals: 1