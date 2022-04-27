tests
testUpdateQueriesList
	self assert: browser queries roots size equals: 0.
	browser model addQuery: MiCriticBrowserPharoCodeQuery new.
	browser updateQueriesList.
	self assert: browser queries roots size equals: 1