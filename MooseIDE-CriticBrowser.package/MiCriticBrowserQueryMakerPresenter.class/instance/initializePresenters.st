initialization
initializePresenters

	codeButton := self newButton.
	queriesBrowserButton := self newButton.
	codeInput := self newCode.
	queryDroplist := self newDropList.
	addButton := self newButton.
	closeButton := self newButton.
	
	codeButton label: 'Pharo Code';
		action: [ self codeButtonAction ].
	
	queriesBrowserButton label: 'Queries Browser';
		action: [ self queriesBrowserButtonAction ].
	
	addButton label: 'Add query';
		icon: (self iconNamed: #smallAdd).
		
	closeButton label: 'Close';
		icon: (self iconNamed: #glamorousClose);
		action: [ owner closeQueryMakerButtonAction ].
	
	codeInput text: '[ :entity | ]'.
	
	codePresenter := MiPresenter new 
		layout: (SpBoxLayout newTopToBottom 
						add: codeInput;
						yourself); 
		yourself.
	
	queryDroplist items: self fetchQueries.
	
	queriesBrowserPresenter := MiPresenter new 
		layout: (SpBoxLayout newTopToBottom 
						add: queryDroplist; 
						yourself);
		yourself.