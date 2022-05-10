tests
testUpdateQueriesList
	self assert: browser queries roots size equals: 0.
	browser model addRule: stubRule.
	browser updateQueriesList.
	self assert: browser queries roots size equals: 1