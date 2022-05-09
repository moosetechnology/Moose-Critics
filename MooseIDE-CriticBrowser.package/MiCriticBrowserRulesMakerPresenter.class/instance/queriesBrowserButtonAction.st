buttons actions
queriesBrowserButtonAction
	changeableBlock 
		removeAll; 
		add: ('Choose a query :' asPresenter) expand: false;
		add: queriesBrowserPresenter.
	codeInput hide. queryDroplist show.