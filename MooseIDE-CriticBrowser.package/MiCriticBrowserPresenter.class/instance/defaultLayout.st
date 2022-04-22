layout
defaultLayout
	
	^ SpPanedLayout newTopToBottom
	add: (SpPanedLayout newLeftToRight 
			add: (SpBoxLayout newTopToBottom
					add: critiques;
					yourself);
			add: (SpBoxLayout newTopToBottom 
					add: invalidEntities;
					yourself);
			yourself);
	add: textArea;
	yourself