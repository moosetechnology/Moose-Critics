layout
defaultLayout
	
	^ SpBoxLayout newTopToBottom
		add: (SpGridLayout new 
			add: inspectButton at: 1 @ 1;
			add: queryDroplist at: 3 @ 1;
			yourself); 
		add: (SpPanedLayout newTopToBottom 
			add: (SpBoxLayout newTopToBottom 
				add: queryInput;
				add: (SpBoxLayout newLeftToRight
					addLast: addButton;
					spacing: 5; 
					addLast: runButton;
					yourself) expand: false;
				yourself);
			add: (SpPanedLayout newTopToBottom
				add: (SpPanedLayout newLeftToRight 
					add: queries;
					add: queryResult;
					yourself);
				add: textArea;
				yourself);
			yourself);
		yourself