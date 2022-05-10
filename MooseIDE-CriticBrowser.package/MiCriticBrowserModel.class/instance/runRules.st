execution
runRules
"run on the entities every query in the model, and stores in output the result of each query linked to a key (the query)"
	rules do: [ :each | output at: each put: (each runOn: entities) ].
	