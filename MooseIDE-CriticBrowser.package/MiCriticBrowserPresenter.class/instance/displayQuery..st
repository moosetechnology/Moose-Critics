updating screen
displayQuery: selectedQuery
"displays the queries, adding the number of entities they get if the query has been executed"
	^ (model output includesKey: selectedQuery) 
	ifTrue: 
		[ (selectedQuery query asString), ' (' , ((model output at: selectedQuery) size asString) , ')'] 
	ifFalse: [ selectedQuery query ]