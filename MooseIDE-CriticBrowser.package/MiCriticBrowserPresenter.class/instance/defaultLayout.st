layout
defaultLayout
	
	^ SpPanedLayout newTopToBottom
	add: (SpPanedLayout newLeftToRight 
			add: (SpBoxLayout newTopToBottom
					add: entities;
					yourself);
			add: (SpBoxLayout newTopToBottom 
					add: queryResult;
					yourself);
			yourself);
	add: textArea;
	yourself