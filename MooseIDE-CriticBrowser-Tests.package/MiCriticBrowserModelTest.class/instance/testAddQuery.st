tests
testAddQuery
	model addQuery: 'test'.
	self assert: model queries size equals: 0.
	
	model addQuery: MiCriticBrowserPharoCodeQuery new.
	self assert: model queries size equals: 1 