initialization
initializePresenters

	saveButton := self newButton.
	addButton := self newButton.
	
	saveButton
		label: 'Save Critiques';
		icon: (self iconNamed: #smallSave).

	addButton
		label: 'Add Critique';
		icon: (self iconNamed: #smallAdd);
		action: [ self owner dialogWriteInCode ]