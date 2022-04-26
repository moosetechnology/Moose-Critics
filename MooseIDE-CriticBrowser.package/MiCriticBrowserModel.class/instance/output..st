accessing
output: anObject

	output removeAll.
	anObject isCollection ifTrue: [ output := anObject ] ifFalse: [ output add: anObject ].