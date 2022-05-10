initialization
initializeButtons
	codeButton := self newRadioButton.
	queriesBrowserButton := self newRadioButton.
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
		action: [ self window close ]