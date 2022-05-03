initialization
initializeButtons
	inspectButton := self newButton.
	openQueryMakerButton := self newButton.
	runButton := self newButton.
	
	openQueryMakerButton label: 'Add rules';
				 icon: (self iconNamed: #smallAdd);
				 action: [ self openQueryMakerButtonAction ].
	
	runButton label: 'Run';
				 icon: (self iconNamed: #glamorousPlay);
				 action: [ self runButtonAction ].
	
	inspectButton 
		label: 'Inspect model';
		icon: (self iconNamed: #glamorousInspect);
		action: [ self model entities inspect ].