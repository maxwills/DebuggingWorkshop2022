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
DWUtils class >> menu01BrowseActivity01: aBuilder [

	<worldMenu>
	(aBuilder item: #DWSActivity1)
		parent: #DebWorkshop;
		action: [ BaptismByFireHints class browse ];
		label: 'Act 01 - BaptismByFire scripts';
		icon: (self iconNamed: 'smallNew');
		help: 'Browses BaptimsByFire scripts';
		order: 1
]

{ #category : #'as yet unclassified' }
DWUtils class >> menu02ShowEggHunt: aBuilder [

	<worldMenu>
	(aBuilder item: #ShowEgghunt)
		parent: #DebWorkshop;
		action: [ EggHunt openInPlayground ];
		label: 'Act 03 - Open EggHunt in Playground';
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
		label: 'Act 02 - Stepping Challenge';
		"icon: (self iconNamed: 'nautilus');"
		help: 'Stepping Challenge';
		order: 2
]

{ #category : #'as yet unclassified' }
DWUtils class >> menu04RestoreOrderedCollectionAdd: aBuilder [

	<worldMenu>
	(aBuilder item: #RestoreOrderedCollectionAdd)
		parent: #DebWorkshop;
		action: [ self restoreOrderedCollectionAdd ];
		label: 'Restore OrderedCollection>>#add: source code';
		icon: (self iconNamed: 'repair');
		help: 'Restore OrderedCollection>>#add: source code';
		order: 3
]

{ #category : #'as yet unclassified' }
DWUtils class >> menu05RemoveAllUInstrumentation: aBuilder [

	<worldMenu>
	(aBuilder item: #RemoveAllInstrumentation)
		parent: #DebWorkshop;
		action: [ self removeAllInstrumentation ];
		label: 'Remove All Instrumentation';
		"icon: (self iconNamed: 'nautilus');"
		help: 'Remove All Instrumentation';
		order: 4
]

{ #category : #'as yet unclassified' }
DWUtils class >> menu06ClearLogger: aBuilder [

	<worldMenu>
	(aBuilder item: #ClearLogger)
		parent: #DebWorkshop;
		action: [ ExampleLogger reset"Yourlogger reset" ];
		label: 'Reset Logger';
		"icon: (self iconNamed: 'nautilus');"
		help: 'Reset Logger';
		order: 8
]

{ #category : #'as yet unclassified' }
DWUtils class >> patchClyOldMessageBrowserAdapter [

	"Fixes a bug related to browsing implementors that filtered out proxified methods"

	<script>
	ClyOldMessageBrowserAdapter compile: 'messages: anObject

	messages := anObject collect: [ :m | 
		            (m respondsTo: #unproxifiedMethod)
			            ifTrue: [ m unproxifiedMethod ]
			            ifFalse: [ m ] ]'
]

{ #category : #'as yet unclassified' }
DWUtils class >> patchMpMethodProxy [

	"Fixes a calypso bug related to proxies"

	<script>
	MpMethodProxy compile: 'calypsoEnvironmentType
	"See QuickWrapMethodProxy >> #calypsoEnvironmentType"
	^ proxifiedMethod calypsoEnvironmentType'
]

{ #category : #'as yet unclassified' }
DWUtils class >> prepareWorkshop [

	<script>
	Author fullName: 'author'.
	self introduceBugs.
	self patchClyOldMessageBrowserAdapter.
	self patchMpMethodProxy.
	self resetKeyshortcuts
]

{ #category : #removing }
DWUtils class >> removeAllInstrumentation [

	<script>
	InstrumentationUtils uninstallAllLinks.
	InstrumentationUtilsMethodProxies uninstallAll
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

{ #category : #'as yet unclassified' }
DWUtils class >> tryShowJPGImage: url [

	[ (ZnEasy getJpeg: url) asMorph openInWindow ] onErrorDo: [ :e | 
		e class = NameLookupFailure ifTrue: [ 
			^ self inform: 'Image url unreachable. Aborting.' ].
		e resumeUnchecked: e ]
]

{ #category : #'as yet unclassified' }
DWUtils class >> tryShowPNGImage: url [

	[ (ZnEasy getPng: url) asMorph openInWindow ] onErrorDo: [ :e | 
		e class = NameLookupFailure ifTrue: [ 
			^ self inform: 'Image url unreachable. Aborting.' ].
		e resumeUnchecked: e ]
]
