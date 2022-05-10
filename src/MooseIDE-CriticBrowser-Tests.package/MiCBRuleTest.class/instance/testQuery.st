test
testQuery
	self should: [ MiCBRule named: 'test' on: 'test' ] raise: NotAValidQuery.
	self shouldnt: [ MiCBRule named: 'test' on: (MiCriticBrowserPharoCodeQuery new) ] raise: NotAValidQuery