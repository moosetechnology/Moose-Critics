initialization
initializePresenters

	codeButton := self newRadioButton.
	queriesBrowserButton := self newRadioButton.
	ruleTitle := self newTextInput.
	codeInput := self newCode.
	queryDroplist := self newDropList.
	addButton := self newButton.
	closeButton := self newButton.
	
	codeButton label: 'Pharo Code';
		whenActivatedDo: [ self codeButtonAction ];
		associatedRadioButtons: { queriesBrowserButton }.
	
	queriesBrowserButton label: 'Queries Browser';
		whenActivatedDo: [ self queriesBrowserButtonAction ].
	
	addButton label: 'Add query';
		icon: (self iconNamed: #smallAdd);
		action: [ self addButtonAction ].
		
	closeButton label: 'Close';
		icon: (self iconNamed: #glamorousClose);
		action: [ self delete ].
	
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