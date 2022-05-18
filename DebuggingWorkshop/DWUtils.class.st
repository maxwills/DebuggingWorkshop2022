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
DWUtils class >> menu00DebWorkshopOn: aBuilder [

	<worldMenu>
	(aBuilder item: #DebWorkshop)
		label: 'DebuggingWorkshop';
		icon: (self iconNamed: 'smallExpert');
		help: 'DebuggingWorkshop commands';
		order: 100
]

{ #category : #'as yet unclassified' }
DWUtils class >> menu01BrowseChallenges: aBuilder [

	<worldMenu>
	(aBuilder item: #Challenges)
		parent: #DebWorkshop;
		action: [ Challenges class browse ];
		label: 'Browse Challenges class';
		icon: (self iconNamed: 'nautilus');
		help: 'Browse Challenges';
		order: 1
]

{ #category : #'as yet unclassified' }
DWUtils class >> prepareWorkshop [

	<script>
	Author fullName: 'author'.
	self introduceBugs
]
