updating screen
updateResultList: aCollection
	| roots |
	roots := (aCollection allEntityTypes collect: [ :type | 
		           aCollection allWithType: type ]) asOrderedCollection.
	roots do: [ :group | group description: group details ].
	queryResult roots:
		(roots sort: [ :group | group description onlyLetters ] ascending).
	
	queryResult roots: roots.
	queryResult refresh.
	self updateToolbar