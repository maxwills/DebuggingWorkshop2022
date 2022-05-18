Class {
	#name : #EggHunter,
	#superclass : #Object,
	#instVars : [
		'name',
		'bags'
	],
	#category : #'DebuggingWorkshop-Story'
}

{ #category : #'instance creation' }
EggHunter class >> newAlice [

	^ self new
		  name: #Alice;
		  yourself
]

{ #category : #'instance creation' }
EggHunter class >> newBob [

	^ self new
		  name: #Bob;
		  yourself
]

{ #category : #'instance creation' }
EggHunter class >> newCharlie [

	^ self new
		  name: #Charlie;
		  yourself
]

{ #category : #'as yet unclassified' }
EggHunter >> assignBags: aNumber [

	aNumber timesRepeat: [ bags add: OrderedCollection new ]
]

{ #category : #accessing }
EggHunter >> bags [

	^ bags
]

{ #category : #accessing }
EggHunter >> bags: anObject [

	bags := anObject
]

{ #category : #'as yet unclassified' }
EggHunter >> biggestBagSize [

	| maxSize |
	maxSize := 0.
	bags do: [ :b | maxSize := maxSize max: b size ].
	^ maxSize
]

{ #category : #'as yet unclassified' }
EggHunter >> countEggs [

	| count |
	count := 0.
	count := bags do: [ :b | count := count + b size ].
	^ count
]

{ #category : #initialization }
EggHunter >> initialize [

	bags := OrderedCollection new
]

{ #category : #accessing }
EggHunter >> name [

	^ name
]

{ #category : #accessing }
EggHunter >> name: anObject [

	name := anObject
]

{ #category : #'as yet unclassified' }
EggHunter >> storeAnEggInRandomBag: random [

	| bag |
	bag := bags at: (random nextIntegerBetween: 1 and: bags size).
	bag add: (Egg new
			 id: (random nextIntegerBetween: 1 and: 1000000);
			 yourself)
]
