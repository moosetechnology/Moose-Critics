buttons actions
openQueryMakerButtonAction
	changeableBlock
		removeAll;
		add: ('Query maker' asPresenter) expand: false; 
		add: queryMakerPresenter.
	queryMakerPresenter codeButtonAction 