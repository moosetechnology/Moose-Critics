accessing
addRule: aRule

	(aRule class = MiCBRule) ifTrue: [ rules add: aRule ]