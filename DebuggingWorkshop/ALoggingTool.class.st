Class {
	#name : #ALoggingTool,
	#superclass : #Object,
	#classInstVars : [
		'enabled'
	],
	#category : #DebuggingWorkshop
}

{ #category : #logging }
ALoggingTool class >> clear [
Transcript clear
]

{ #category : #accessing }
ALoggingTool class >> enabled [

	^ enabled ifNil: [ enabled := true ]
]

{ #category : #accessing }
ALoggingTool class >> enabled: anObject [

	enabled := anObject
]

{ #category : #logging }
ALoggingTool class >> log: aString [
Transcript show: aString; cr
]
