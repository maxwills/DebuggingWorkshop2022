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

	"<worldMenu>"
	(aBuilder item: #Challenges)
		parent: #DebWorkshop;
		action: [ Challenges class browse ];
		label: 'Browse Challenges class';
		icon: (self iconNamed: 'nautilus');
		help: 'Browse Challenges';
		order: 1
]

{ #category : #'as yet unclassified' }
DWUtils class >> menu02ShowEggHunt: aBuilder [

	<worldMenu>
	(aBuilder item: #ShowEgghunt)
		parent: #DebWorkshop;
		action: [ EggHunt openInPlayground ];
		label: 'Open EggHunt in Playground';
		"icon: (self iconNamed: 'nautilus');"
		help: 'Open EggHunt in Playground';
		order: 2
]

{ #category : #'as yet unclassified' }
DWUtils class >> menu03ShowSteppingChallenge: aBuilder [

	<worldMenu>
	(aBuilder item: #ShowSteppingChallenge)
		parent: #DebWorkshop;
		action: [ Challenges launchTask1 ];
		label: 'Stepping Challenge';
		"icon: (self iconNamed: 'nautilus');"
		help: 'Stepping Challenge';
		order: 1
]

{ #category : #'as yet unclassified' }
DWUtils class >> prepareWorkshop [

	<script>
	Author fullName: 'author'.
	self introduceBugs.
	self resetKeyshortcuts
]

{ #category : #initialization }
DWUtils class >> resetKeyshortcuts [

	"Nothing to do with reflectio, but I didnt want to create a class just for this method"

	"Resets the KeyMappings, so the new shortcuts are activated"

	<script>
	KMRepository reset
]

{ #category : #'as yet unclassified' }
DWUtils class >> restoreOrderedCollectionAdd [
	"Programmatically recompiles the original code of OrderedCollection>>add:"
	"Click the script icon in the method list to restore the method OrderedCollection>>add:"
	<script>
	OrderedCollection compile: 'add: newObject
	
	"Add a new object at the end of the collection, and returns the object itself"

	"((OrderedCollection new add: 42; yourself) add: 43; yourself) asArray >>> #(42 43)"

	"Add returns the object itself"

	"(OrderedCollection new add: 42) >>> 42"

	"You may want to use yourself to return the collection itself"

	"(OrderedCollection new add: 42; yourself) class >>> OrderedCollection"

	"(OrderedCollection new add: 42; yourself) size >>> 1"

	
	^ self addLast: newObject'.
	self inform: '(OrderedCollection >> add:) has been restored'
]
