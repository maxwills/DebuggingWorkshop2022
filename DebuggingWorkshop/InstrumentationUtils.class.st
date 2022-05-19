Class {
	#name : #InstrumentationUtils,
	#superclass : #Object,
	#category : #'DebuggingWorkshop-Utils'
}

{ #category : #'as yet unclassified' }
InstrumentationUtils class >> doLoggingOfAddedEggs [

	"Find the context of the add: method activation"

	"Can only be used form inside the execution (via code insertion or instrumentation)"

	| ourClasses |
	ourClasses := { 
		              Egg.
		              EggHunter.
		              EggHunt }.
	(thisContext findContextSuchThat: 1) ifNotNil: [ :ctx | 
		| newObject |
		newObject := ctx arguments first.
		newObject isAssociation ifTrue: [ newObject := newObject value ].
		(ourClasses includes: newObject class) ifTrue: [ 
			ALoggingTool log: ctx receiver class name , ' >> add: called from instrumentation' ] ]
]

{ #category : #'as yet unclassified' }
InstrumentationUtils class >> doLoggingOfAddedEggsSimple [

	"Find the context of the add: method activation"

	"Can only be used form inside the execution (via code insertion or instrumentation)"

	(thisContext findContextSuchThat: [ :ctx | 
		 ctx method selector = #add: ]) ifNotNil: [ :ctx | 
		| newObject |
		newObject := ctx arguments first.
		newObject class = Egg ifTrue: [ 
			ALoggingTool log:
				'OrderedCollection >> add: called from instrumentation' ] ]
]

{ #category : #'as yet unclassified' }
InstrumentationUtils class >> ex1_installLoggingMetalinkInCollectionAdd [

	"The metalink will execute the method 
	(InstrumentationUtils class)>>#doLoggingOfAddedApples) on activation"
	
	"(InstrumentationUtils class>>#doLoggingOfAddedApples) browse"

	<script>
	| metalink |
	metalink := MetaLink new.
	metalink selector: #doLoggingOfAddedEggsSimple.
	metalink metaObject: InstrumentationUtils.
	metalink control: #after.
	
	(OrderedCollection >> #add:) ast link: metalink
]

{ #category : #'as yet unclassified' }
InstrumentationUtils class >> ex2_installLoggingMetalinkInEveryMethodAdd [

	<script>
	| implementorsOfAdd |
	implementorsOfAdd := InstrumentationUtils implementorsOf: #add:.
	implementorsOfAdd do: [ :cls | 
		|metalink|
		metalink := MetaLink new.
		metalink selector: #doLoggingOfAddedEggs.
		metalink metaObject: InstrumentationUtils.
		metalink control: #before.
		(cls >> #add:) ast link: metalink ]
]

{ #category : #'as yet unclassified' }
InstrumentationUtils class >> implementorsOf: selector [

	"returns the classes that implement the add: selector"

	| implementors |
	"note: If using proxies, isInstalled might return false, so be careful"
	implementors := Set new.
	CompiledMethod allInstancesDo: [ :m | "m unproxifiedMethod" 
		(m selector = #add: and: [ m isInstalled ]) ifTrue: [ implementors add: m methodClass ] ].

	^ implementors
]

{ #category : #'as yet unclassified' }
InstrumentationUtils class >> installLoggingMetalinkInEveryMethodAdd [

	<script>
	| implementorsOfAdd |
	implementorsOfAdd := InstrumentationUtils implementorsOf: #add:.
	implementorsOfAdd do: [ :cls | 
		|metalink|
		metalink := MetaLink new.
		metalink selector: #doLoggingOfAddedApples.
		metalink metaObject: InstrumentationUtils.
		metalink control: #before.
		(cls >> #add:) ast link: metalink ]
]

{ #category : #'as yet unclassified' }
InstrumentationUtils class >> installLoggingMetalinkInMethod: aCompiledMethod [

	| metalink |
	metalink := MetaLink new.
	metalink selector: #doLoggingOfAddedEggsSimple.
	metalink metaObject: self.
	metalink control: #before.
	aCompiledMethod ast link: metalink
]

{ #category : #'as yet unclassified' }
InstrumentationUtils class >> uninstallAllLinks [

	<script>
	MetaLink uninstallAll
]
