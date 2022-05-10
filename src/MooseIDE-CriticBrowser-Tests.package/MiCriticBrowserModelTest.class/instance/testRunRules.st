tests
testRunRules
	| entity1 entity2 rule1 rule2 group |
	entity1 := FamixStMethod new.
	entity2 := FamixStMethod new.
	entity1 isStub: true.
	group := MooseGroup new.
	group add: entity1; add: entity2.
	rule1 := MiCBRule named: 'test1' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isStub ]'). 
	rule2 := MiCBRule named: 'test2' on: (MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isDead ]').
	
	model setEntities: group; addRule: rule1; addRule: rule2.
	model runRules.
	self assert: model output size equals: 2.
	self assertCollection: (model output at: rule1) includesAll: {entity1}.
	self assertCollection: (model output at: rule2) includesAll: group.
	