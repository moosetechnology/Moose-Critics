layout
defaultLayout
	
	| choiceBar actionBar |
	
	choiceBar := SpBoxLayout newLeftToRight 
		add: codeButton;
		add: queriesBrowserButton;
		beHomogeneous;
		yourself.
		
	actionBar := SpBoxLayout newLeftToRight 
		add: closeButton;
		add: addButton;
		beHomogeneous;
		yourself.
	
	changeableBlock := SpBoxLayout newTopToBottom 
		add: codePresenter;
	yourself.
	
	^ SpBoxLayout newTopToBottom
		add: choiceBar expand: false;
		add: changeableBlock;
		add: actionBar expand: false;
		yourself
		