running
runOn: aGroupOfEntities
"runs the query on the input group of entities, and returns the entities validating the query"
	^ aGroupOfEntities select: [ :each | self query value: each ]