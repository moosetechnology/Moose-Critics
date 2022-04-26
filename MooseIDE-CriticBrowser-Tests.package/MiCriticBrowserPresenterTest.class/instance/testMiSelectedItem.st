test
testMiSelectedItem

	| entity entityStub group |
	entity := MooseEntity new.
	entityStub := MooseEntity new.
	entityStub isStub: true.
	group := MooseGroup new.
	group add: entity; add: entityStub.
	
	"propagating the entity for the model to receive it"
	browser receiveEntity: group.
	
	self assertCollection: (browser miSelectedItem) hasSameElements: group.
	
	browser queryInput text: 'entity isStub'.
	browser runButton performAction.
	
	self assertCollection: (browser miSelectedItem) hasSameElements: {entityStub}.