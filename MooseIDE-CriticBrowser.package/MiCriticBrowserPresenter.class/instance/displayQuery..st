as yet unclassified
displayQuery: selectedQuery

	^ (model output includesKey: selectedQuery) 
	ifTrue: 
		[ (selectedQuery query asString), ' (' , ((model output at: selectedQuery) size asString) , ')'] 
	ifFalse: [ selectedQuery query ]