selected object
selectedQueries
	| entitiesList |
	entitiesList := MooseGroup new.
	(queries selectedItems) ifNotEmpty: [  
	(queries selectedItems) do: [ :each | entitiesList := entitiesList | (model output at: each) ].
	self updateResultList: entitiesList ]
									ifEmpty: [ self updateResultList: model getCompleteOutput ]