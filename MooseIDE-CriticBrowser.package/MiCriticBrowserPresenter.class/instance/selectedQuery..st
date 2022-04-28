as yet unclassified
selectedQuery: aQuery
	(aQuery) ifNotNil: [ self updateResultList: (model output at: aQuery) ]