accessing
getCompleteOutput
	| result |
	result := MooseGroup new.
	output do: [ :each | result := result | each ].
	^ result