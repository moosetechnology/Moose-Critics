buttons actions
codeButtonAction
	changeableBlock 
		removeAll;
		add: ('Input for code query :' asPresenter) expand: false;
		add: codePresenter.
	codeInput show. queryDroplist hide.
	codeInput text: '[ :entity | ]'.