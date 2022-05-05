updating screen
displayQuery: selectedQuery
"displays the queries, adding the number of entities they get if the query has been executed"
	^ (model output includesKey: selectedQuery) 
	ifTrue: 
		[ (selectedQuery name), ' (' , ((model output at: selectedQuery) size asString) , ')'] 
	ifFalse: [ selectedQuery name ]