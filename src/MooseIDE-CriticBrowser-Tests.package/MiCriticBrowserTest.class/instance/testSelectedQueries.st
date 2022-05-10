test
testSelectedQueries
	browser model setEntities: { stubEntity. basicEntity } asMooseGroup.
	browser model addRule: stubRule; addRule: deadRule.
	browser model runRules.
	browser updateQueriesList.
	browser updateResultList: browser model getCompleteOutput.
	
	browser queries selectItem: stubRule.
	self assert: browser queryResult roots flatten size equals: 1.
	self assert: browser queryResult roots flatten anyOne equals: stubEntity.
	
	browser queries selectItem: deadRule.
	self assert: browser queryResult roots flatten size equals: 2.
	self assertCollection: browser queryResult roots flatten includesAll: { stubEntity. basicEntity }.
	