running
setUp
	super setUp.
	stubRule := MiCBRule named: 'test1' on: ((MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]')).
	deadRule := MiCBRule named: 'test2' on: ((MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isDead ]')).
	stubEntity := FamixStMethod new.
	stubEntity name: 'test1'; isStub: true.
	basicEntity := FamixStMethod new.
	basicEntity name: 'test2'
	
