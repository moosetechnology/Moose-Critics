accessing
query: aQuery

	(aQuery class inheritsFrom: MiCriticBrowserAbstractQuery) 
		ifTrue: [ query := aQuery ]
		ifFalse: [ self error: NotAValidQuery signal ]