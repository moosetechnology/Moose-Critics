running
runOnCollection: aCollection
	^ (query parent class = FQRootQuery or: [ query parent isNil ])
		ifTrue: [ query runOn: aCollection ]
		ifFalse: [ | parentQuery | parentQuery := self class on: query parent.
											query runOn: (parentQuery runOnCollection: aCollection) ]