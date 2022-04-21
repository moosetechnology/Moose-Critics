columns management
updateEntitiesList
	
	critiques := self newTreeTable.
	critiques addColumn: (SpStringTableColumn new title: 'Entities'; evaluated: #name );
				 roots: {self model allAccesses}, {self model allModelClasses} ;
				 children: [ :each | (each isCollection) ifTrue: [ each asCollection sorted: [ :a :b | (a name) <= (b name) ] ] ifFalse: [ { } ] ].
	critiquesBox replace: (critiquesBox children at:1) with: critiques.