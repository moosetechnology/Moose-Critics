layout
defaultLayout
	
	| choiceBar |
	
	choiceBar := SpBoxLayout newLeftToRight 
		add: codeButton;
		add: queriesBrowserButton;
		beHomogeneous;
		yourself.
	
	changeableBlock := SpBoxLayout newTopToBottom 
		add: codePresenter;
	yourself.
	
	^ SpBoxLayout newTopToBottom
		add: choiceBar expand: false;
		add: changeableBlock;
		yourself
		