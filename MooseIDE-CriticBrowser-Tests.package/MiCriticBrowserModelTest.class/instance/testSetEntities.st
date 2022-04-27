test
testSetEntities
	| entityA entityB group |
	entityA := FamixStMethod new. 
	entityA name: 'a'.
	entityB := FamixStMethod new.
	entityB name: 'b'.
	group := MooseGroup new.
	group add: entityB; add: entityA.
	
	model setEntities: group.
	
	self assert: (model entities at:1) equals: entityA.
	self assert: (model entities at:2) equals: entityB.
	self assert: model entities class equals: group class
	