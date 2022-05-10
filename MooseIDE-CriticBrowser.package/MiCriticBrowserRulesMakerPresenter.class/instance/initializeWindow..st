initialization
initializeWindow: aWindowPresenter	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: self defaultTitle;
		initialExtent: 460 @ 460