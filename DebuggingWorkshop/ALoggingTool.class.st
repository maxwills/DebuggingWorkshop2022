Class {
	#name : #ALoggingTool,
	#superclass : #Object,
	#classInstVars : [
		'enabled',
		'counter'
	],
	#category : #'DebuggingWorkshop-Utils'
}

{ #category : #accessing }
ALoggingTool class >> counter [

	^ counter ifNil: [ counter := 0 ]
]

{ #category : #accessing }
ALoggingTool class >> counter: anObject [

	counter := anObject
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

	self enabled ifFalse: [ ^ self ].
	counter := self counter + 1.
	Transcript
		show: counter asString , '. ' , aString;
		cr
]

{ #category : #logging }
ALoggingTool class >> reset [

	<script>
	counter := 0.
	Transcript clear
]
