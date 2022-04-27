execution
runQueries
"run on the entities every query in the model, and stores in output every entity returning true to a query (if an entity returns true several times, it's still present only once in the output collection)"
	| result temp |
	result := output removeAll.
	queries do: [ :each | temp := (each runOn: entities). result := result | temp ].
	output := (result sort: [ :a :b | a name < b name ]) asMooseGroup
	