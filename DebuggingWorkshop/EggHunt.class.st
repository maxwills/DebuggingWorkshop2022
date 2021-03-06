Class {
	#name : #EggHunt,
	#superclass : #Object,
	#instVars : [
		'hunters',
		'random'
	],
	#category : #'DebuggingWorkshop-Story'
}

{ #category : #'as yet unclassified' }
EggHunt class >> eggHuntCode [

	"This is the program we must explore"

	| huntEvent winner |
	huntEvent := EggHunt new.
	huntEvent giveHuntersSomeBags.
	huntEvent goHunting.
	winner := huntEvent calculateRanks first.
	^ winner
	
"Q1. How many times OrderedCollection>>#add: is called? (with Egg Objects?)"
"Q2. From which methods is OrderedCollection>>#add: is called? (with Egg Objects?)"
"Q3. How many times any method with selector add: is called? (with Egg or Hunter Objects? which method?)"
]

{ #category : #'as yet unclassified' }
EggHunt class >> letItBegin [

	| a winner |
	a := EggHunt new.
	a giveHuntersSomeBags.
	a goHunting.
	winner := a calculateRanks first.
	winner biggestBagSize.
	^ winner
]

{ #category : #'as yet unclassified' }
EggHunt class >> openInPlayground [

	<script>
	| code removeSubstrings |
	removeSubstrings := [ :str :substr | str copyReplaceAll: substr with: '' ].

	code := (self class >> #eggHuntCode) sourceCode.
	code := removeSubstrings value: code value: String tab.
	code := removeSubstrings value: code value: 'eggHuntCode'.
	StPlayground openContents: code trim
]

{ #category : #'as yet unclassified' }
EggHunt >> calculateRanks [
	"Returns a SortedCollection, where the first element is the hunter with the biggest bag size, and the last is the one with the smallest"
	| ranked |
	ranked := SortedCollection sortUsing: [ :h1 :h2 | h1 biggestBagSize > h2 biggestBagSize ].
	hunters valuesDo: [ :hunter | ranked add: hunter ].
	^ ranked
]

{ #category : #'as yet unclassified' }
EggHunt >> doHuntingDay: dayNumber [

	"performs a hunting stage"

	| maxApples |
	maxApples := 10 * dayNumber.

	hunters valuesDo: [ :hunter | 
		| huntedApples |
		"get a random number of apples"
		huntedApples := random nextIntegerBetween: 1 and: maxApples.
		"add the apples in random bags of the hunter"
		huntedApples timesRepeat: [ hunter storeAnEggInRandomBag: random ] ]
]

{ #category : #'as yet unclassified' }
EggHunt >> giveHuntersSomeBags [

	| maxBags |
	maxBags := 5.
	"Give hunter some bags"
	hunters valuesDo: [ :hunter | hunter assignBags: (random nextIntegerBetween: 1 and: maxBags) ].
	
	
]

{ #category : #'as yet unclassified' }
EggHunt >> goHunting [

	"performs sequentially every stage of the hunt"

	| nTimes |
	nTimes := 4.
	1 to: nTimes do: [ :i | self doHuntingDay: i ]
]

{ #category : #accessing }
EggHunt >> hunters [

	^ hunters
]

{ #category : #accessing }
EggHunt >> hunters: anObject [

	hunters := anObject
]

{ #category : #initialization }
EggHunt >> initialize [

	random := self newRandom.
	hunters := Dictionary new
		           add: #Alice -> EggHunter newAlice;
		           add: #Bob -> EggHunter newBob;
		           add: #Charlie -> EggHunter newCharlie;
		           yourself
]

{ #category : #initialization }
EggHunt >> newRandom [

	^ Random new
		  seed: 1;
		  yourself
]
