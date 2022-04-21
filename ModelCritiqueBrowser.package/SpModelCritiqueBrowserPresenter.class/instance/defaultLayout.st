layout
defaultLayout 
	
	critiquesBox := (SpBoxLayout newTopToBottom
					add: critiques;
					addLast: critiquesToolbar expand: false;
					yourself).
	
	^ SpPanedLayout newTopToBottom
	add: (SpPanedLayout newLeftToRight 
			add: critiquesBox;
			add: (SpBoxLayout newTopToBottom 
					add: invalidEntities;
					addLast: entitiesToolbar expand: false;
					yourself);
			yourself);
	add: textArea;
	yourself