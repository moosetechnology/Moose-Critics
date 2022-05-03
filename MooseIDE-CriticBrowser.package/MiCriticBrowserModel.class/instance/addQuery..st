accessing
addQuery: aQuery

	(aQuery class inheritsFrom: MiCriticBrowserAbstractQuery) ifTrue: [ queries add: aQuery ]