initialization
initializePresenters
	
	self initializeButtons.
	
	ruleTitle := self newTextInput.
	ruleSummary := self newText.
	codeInput := self newCode.
	queryDroplist := self newDropList.
	
	codeInput text: '[ :entity | ]'.
	
	codePresenter := MiPresenter new 
		layout: (SpBoxLayout newTopToBottom 
						add: codeInput;
						yourself); 
		yourself.
	
	queryDroplist startWithoutSelection;
					  items: self fetchQueries;
					  centered.
	
	queriesBrowserPresenter := MiPresenter new 
		layout: (SpBoxLayout newTopToBottom 
						add: queryDroplist expand: false; 
						yourself);
		yourself