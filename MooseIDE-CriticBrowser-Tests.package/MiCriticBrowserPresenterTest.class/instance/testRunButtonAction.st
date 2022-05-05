test
testRunButtonAction
	| entity |
	entity := MooseEntity new.
	
	"propagating the entity for the model to receive it"
	browser privateReceivingMode: MiFollowMode.
	self bus globallySelect: entity.
	
	browser model addQuery: ((MiCriticBrowserPharoCodeQuery on: '[ :entity | entity isMooseEntity ]') name: 'Test').
	browser runButton performAction.
	
	self assert: browser model output size equals: 1 
	