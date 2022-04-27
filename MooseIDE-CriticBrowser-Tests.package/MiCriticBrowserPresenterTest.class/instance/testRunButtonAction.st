test
testRunButtonAction
	| entity |
	entity := MooseEntity new.
	
	"propagating the entity for the model to receive it"
	browser privateReceivingMode: MiFollowMode.
	self bus globallySelect: entity.
	
	browser model addQuery: (MiCriticBrowserPharoCodeQuery on: 'entity isMooseEntity').
	browser runButton performAction.
	
	self assert: browser model output size equals: 1 
	