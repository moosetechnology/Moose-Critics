layout
defaultLayout
	
	^ SpPanedLayout newTopToBottom 
		add: (SpBoxLayout newTopToBottom 
			add: queryInput;
			add: (SpBoxLayout newLeftToRight 
				addLast: runButton;
				yourself) expand: false;
			yourself);
		add: (SpPanedLayout newTopToBottom
			add: (SpPanedLayout newLeftToRight 
				add: entities;
				add: queryResult;
				yourself);
			add: textArea;
			yourself);
		yourself