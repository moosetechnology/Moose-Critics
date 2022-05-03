layout
defaultLayout

	changeableBlock := (SpPanedLayout newLeftToRight 
					add: queries;
					add: queryResult;
					yourself).
	
	^ SpBoxLayout newTopToBottom
		add: changeableBlock;
		add: (SpBoxLayout newLeftToRight
				add: inspectButton expand: false;
				addLast: openQueryMakerButton;
				spacing: 5; 
				addLast: runButton;
		yourself) expand: false;
	yourself