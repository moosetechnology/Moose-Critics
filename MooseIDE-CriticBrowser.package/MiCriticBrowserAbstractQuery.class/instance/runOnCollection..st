running
runOnCollection: aCollection
	^ aCollection select: [ :each | [ self runOn: each ] 
		onErrorDo: [ :err | (err class = MessageNotUnderstood) 
			ifTrue: [ false ] 
			ifFalse: [ self error: err ] 
		] ]
	