Class {
	#name : #DWUtils,
	#superclass : #Object,
	#category : #'DebuggingWorkshop-Utils'
}

{ #category : #'as yet unclassified' }
DWUtils class >> introduceAdvanceSteppingBugs [

SindarinDebugger compile: 'stepToReturn

	[ self context willReturn or: [ self hasSignalledUnhandledException ] ] 
		whileFalse: [ self debugSession stepOver ]'.
SindarinDebugger compile: 'stepToMethodEntry
	self stepUntil: [ self context willSend ].
	process step: self context.
	self debugSession updateContextTo: process suspendedContext'
]

{ #category : #'as yet unclassified' }
DWUtils class >> introduceBugs [

	"Introduces the bugs so we can fix them during the session"

	<script>
	self introduceAdvanceSteppingBugs.
	self introduceFormattingBug
]

{ #category : #'as yet unclassified' }
DWUtils class >> introduceFormattingBug [

SycFormatSourceCodeCommand compile:'prepareFullExecutionInContext: aToolContext
	super prepareFullExecutionInContext: aToolContext.
	
	sourceCodeEditor := aToolContext methodEditor'
]

{ #category : #'as yet unclassified' }
DWUtils class >> prepareWorkshop [

	<script>
	self introduceBugs
]
