Class {
	#name : #Logger,
	#superclass : #Object,
	#classInstVars : [
		'capturedEggs'
	],
	#category : #'DebuggingWorkshop-Utils'
}

{ #category : #'as yet unclassified' }
Logger class >> logAddCalled [
	ExampleLogger log: 'Method add called'
]

{ #category : #accessing }
Logger class >> reset [
	<script>
	MetaLink uninstallAll.
	capturedEggs := nil
]
