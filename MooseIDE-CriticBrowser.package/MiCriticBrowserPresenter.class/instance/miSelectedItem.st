accessing
miSelectedItem 

	self model output ifEmpty: [ ^ self model entities ] 
							ifNotEmpty: [ ^ self model output ]