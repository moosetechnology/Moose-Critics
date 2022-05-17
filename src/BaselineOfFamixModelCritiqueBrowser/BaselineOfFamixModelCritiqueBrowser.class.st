Class {
	#name : #BaselineOfFamixModelCritiqueBrowser,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamixModelCritiqueBrowser
}

{ #category : #baselines }
BaselineOfFamixModelCritiqueBrowser >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'MooseIDE-CriticBrowser';
				package: 'MooseIDE-CriticBrowser-Tests';
				package: 'Famix-CriticBrowser-Entities';
				package: 'Famix-CriticBrowser-Generator'
			]
]

{ #category : #accessing }
BaselineOfFamixModelCritiqueBrowser >> projectClass [
	^ MetacelloCypressBaselineProject
]
