as yet unclassified
children: aCollection for: aTreePresenter
"provides content of the children block for the collection root for a given tree presenter"
	^ (aTreePresenter roots includes: aCollection) 
		ifTrue: [ (aTreePresenter roots at: (aTreePresenter roots indexOf: aCollection)) asCollection ] 
		ifFalse: [ {  } ]