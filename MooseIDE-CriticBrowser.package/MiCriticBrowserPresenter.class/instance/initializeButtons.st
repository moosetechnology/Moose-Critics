initialization
initializeButtons
	inspectButton := self newButton.
	openRulesMakerButton := self newButton.
	runButton := self newButton.
	
	openRulesMakerButton
		label: 'Add rules';
		icon: (self iconNamed: #smallAdd);
		action: [ rulesMakerPresenter openDialog ].
	
	runButton 
		label: 'Run';
		icon: (self iconNamed: #glamorousPlay);
		action: [ self runButtonAction ].
	
	inspectButton 
		label: 'Inspect model';
		icon: (self iconNamed: #glamorousInspect);
		action: [ self model entities inspect ].