selected object
selectedQueries
"shows in the output list only the entities validating the selected queries (or the complete output if no query is selected)"
	| entitiesList |
	entitiesList := MooseGroup new.
	(queries selectedItems) ifNotEmpty: [  
	(queries selectedItems) do: [ :each | entitiesList := entitiesList | (model output at: each) ].
	self updateResultList: entitiesList ]
									ifEmpty: [ self updateResultList: model getCompleteOutput ]