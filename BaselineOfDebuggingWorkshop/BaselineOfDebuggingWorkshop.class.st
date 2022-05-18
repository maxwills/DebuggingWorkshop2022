Class {
	#name : #BaselineOfDebuggingWorkshop,
	#superclass : #BaselineOf,
	#category : #BaselineOfDebuggingWorkshop
}

{ #category : #baselines }
BaselineOfDebuggingWorkshop >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'DebuggingWorkshop';
			package: 'DebuggingWorkshop-Tests'.
		spec postLoadDoIt: #postload:package: ]
]

{ #category : #actions }
BaselineOfDebuggingWorkshop >> postload: loader package: packageSpec [

	(self class environment at: #DWUtils)
		prepareWorkshop
]
