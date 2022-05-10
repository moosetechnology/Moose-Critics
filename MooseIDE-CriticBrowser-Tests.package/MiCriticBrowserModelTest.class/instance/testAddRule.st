tests
testAddRule
	model addRule: 'test'.
	self assert: model rules size equals: 0.
	
	model addRule: (MiCBRule named: 'test' on: MiCriticBrowserPharoCodeQuery new).
	self assert: model rules size equals: 1 