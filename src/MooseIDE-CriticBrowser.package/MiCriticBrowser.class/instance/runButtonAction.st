buttons actions
runButtonAction
"executes the queries on the entities stored in the model, then prints the results"
	self model runRules.
	self updateResultList: model getCompleteOutput.
	self updateQueriesList