layout
defaultLayout

	changeableBlock := (SpPanedLayout newLeftToRight 
					add: queries;
					add: queryResult;
					yourself).
	
	^ SpBoxLayout newTopToBottom
		add: (SpGridLayout new 
			add: inspectButton at: 1 @ 1;
			add: queryDroplist at: 3 @ 1;
			add: addQueryButton at: 3 @ 2;
			yourself);
		add: (SpPanedLayout newTopToBottom 
			add: (SpBoxLayout newTopToBottom 
				add: queryInput;
				add: (SpBoxLayout newLeftToRight
					add: unselectButton expand: false;
					addLast: addCodeButton;
					spacing: 5; 
					addLast: runButton;
					yourself) expand: false;
				yourself);
			add: (SpPanedLayout newTopToBottom
				add: changeableBlock;
				add: textArea;
				yourself);
			yourself);
		yourself