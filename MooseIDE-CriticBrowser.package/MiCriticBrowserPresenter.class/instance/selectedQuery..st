selected object
selectedQuery: aQuery
	(aQuery) ifNotNil: [ self updateResultList: (model output at: aQuery) ]