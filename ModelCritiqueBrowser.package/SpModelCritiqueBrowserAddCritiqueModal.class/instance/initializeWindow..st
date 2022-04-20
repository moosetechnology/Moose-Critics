initialization
initializeWindow: aDialogWindowPresenter
	aDialogWindowPresenter
		title: self defaultTitle;
		okAction: [ self sendText ]