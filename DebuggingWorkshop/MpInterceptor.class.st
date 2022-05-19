Class {
	#name : #MpInterceptor,
	#superclass : #MpHandler,
	#instVars : [
		'interceptorBlock'
	],
	#category : #'DebuggingWorkshop-Utils'
}

{ #category : #evaluating }
MpInterceptor >> beforeExecutionWithReceiver: anObject arguments: anArrayOfObjects [

	interceptorBlock value: anObject value: anArrayOfObjects.
	^ super beforeExecutionWithReceiver: anObject arguments: anArrayOfObjects
]

{ #category : #evaluating }
MpInterceptor >> interceptorBlock [

	^ interceptorBlock
]

{ #category : #evaluating }
MpInterceptor >> interceptorBlock: anObject [

	interceptorBlock := anObject
]
