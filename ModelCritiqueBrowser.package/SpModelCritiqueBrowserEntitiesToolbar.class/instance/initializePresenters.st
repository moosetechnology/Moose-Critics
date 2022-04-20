initialization
initializePresenters 
	
	inspectButton := self newButton.
	falsePositiveButton := self newButton.
	
	inspectButton 
		label: 'Inspect';
		icon: (self iconNamed: #smallInspectIt).
	
	falsePositiveButton
		label: 'Mark as wrong';
		icon: (self iconNamed: #smallError)