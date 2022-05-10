updating screen
updateEntitiesList
	| roots |
	roots := (model entities allEntityTypes collect: [ :type | 
		           model entities allWithType: type ]) asOrderedCollection.
	roots do: [ :group | group description: group details ].
	entitiesList roots:
		(roots sort: [ :group | group description onlyLetters ] ascending).
	
	entitiesList roots: roots.
	entitiesList refresh.
	