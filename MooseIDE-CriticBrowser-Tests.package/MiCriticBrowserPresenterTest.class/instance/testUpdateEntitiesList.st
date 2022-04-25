test
testUpdateEntitiesList
	| entity |
	entity := MooseEntity new.
	
	"propagating the entity for the model to receive it"
	browser privateReceivingMode: MiFollowMode.
	self bus globallySelect: entity.
	
	self assert: (browser entities roots size) equals: 1
	