Class {
	#name : #BaselineOfMooseCritics,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseCritics
}

{ #category : #baselines }
BaselineOfMooseCritics >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'MooseIDE-CriticBrowser';
				package: 'MooseIDE-CriticBrowser-Tests';
				package: 'Famix-CriticBrowser-Entities';
				package: 'Famix-CriticBrowser-Generator';
				package: 'Famix-CriticBrowser-Tests'
			]
]

{ #category : #accessing }
BaselineOfMooseCritics >> projectClass [
	^ MetacelloCypressBaselineProject
]
