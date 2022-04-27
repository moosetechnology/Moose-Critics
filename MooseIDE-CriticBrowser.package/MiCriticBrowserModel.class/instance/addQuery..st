accessing
addQuery: aQuery

	(aQuery class superclass = MiCriticBrowserAbstractQuery) ifTrue: [ queries add: aQuery ]