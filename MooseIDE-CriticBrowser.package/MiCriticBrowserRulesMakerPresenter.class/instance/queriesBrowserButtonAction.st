buttons actions
queriesBrowserButtonAction
	changeableBlock 
		removeAll; 
		add: ('Choose a query :' asPresenter) expand: false;
		add: queriesBrowserPresenter;
		expand: false.
	codeInput hide. queryDroplist show.