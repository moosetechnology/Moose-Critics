buttons actions
runButtonAction
	self model runQueries.
	self updateResultList: model getCompleteOutput.
	self updateToolbar