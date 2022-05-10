naming
stringForItem: item
	(queryResult roots includes: item) ifTrue: [ ^ item description ].
	^ item name