buttons actions
runButtonAction
"executes the queries on the entities stored in the model, then prints the results"
	self model runQueries.
	self updateResultList: model getCompleteOutput.
	self updateQueriesList