Class {
	#name : #BaselineOfMooseCritics,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseCritics
}

{ #category : #baselines }
BaselineOfMooseCritics >> baseline: spec [

	<baseline>
	self mooseIDE: spec.
	self famix: spec.
	self stonCustomizer: spec.

	spec for: #common do: [ 
		spec
			package: 'MooseIDE-CriticBrowser'
			with: [ spec requires: #('MooseIDE'. 'STONCustomizer') ];
			package: 'MooseIDE-CriticBrowser-Tests'
			with: [ spec requires: 'MooseIDE-CriticBrowser' ];
			package: 'Famix-CriticBrowser-Entities'
			with: [ spec requires: 'Famix' ];
			package: 'Famix-CriticBrowser-Generator'
			with: [ spec requires: 'Famix' ];
			package: 'Famix-CriticBrowser-Tests'
			with: [ spec requires: 'Famix-CriticBrowser-Entities' ] ]
]

{ #category : #dependencies }
BaselineOfMooseCritics >> famix: spec [

	spec
		baseline: 'Famix'
		with: [ 
		spec repository: 'github://moosetechnology/Famix:development/src' ]
]

{ #category : #dependencies }
BaselineOfMooseCritics >> mooseIDE: spec [

	spec
		baseline: 'MooseIDE'
		with: [ 
		spec repository: 'github://moosetechnology/MooseIDE:development/src' ]
]

{ #category : #accessing }
BaselineOfMooseCritics >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfMooseCritics >> stonCustomizer: spec [
	spec baseline: 'STONCustomizer' with: [ spec repository: 'github://jecisc/STONCustomizer:v1.x.x/src' ]
]
