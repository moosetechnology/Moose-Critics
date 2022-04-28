as yet unclassified
getCompleteOutput
	| result |
	result := MooseGroup new.
	output do: [ :each | result := result | each ].
	^ result