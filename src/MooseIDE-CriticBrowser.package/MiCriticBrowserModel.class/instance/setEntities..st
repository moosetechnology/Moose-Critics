accessing
setEntities: aMooseObject
	aMooseObject isCollection
		ifTrue: [ entities := aMooseObject allUsing: FamixTNamedEntity ]
		ifFalse: [ entities := ({aMooseObject} asMooseGroup) allUsing: FamixTNamedEntity ].