Class {
	#name : #DebuggingWithReflection,
	#superclass : #Object,
	#category : #'DebuggingWorkshop-Workshop'
}

{ #category : #'as yet unclassified' }
DebuggingWithReflection class >> reifyingCallingMethos [

	| ast link |
	ast := (OrderedCollection >> #add:) ast.
	link := MetaLink new.
	link metaObject: Logger.
	link selector: #logAddCalled:by:method:.
	link arguments: #(arguments sender context).
	ast link: link.

	link uninstall
]

{ #category : #'as yet unclassified' }
DebuggingWithReflection class >> reifyingReceiver [

	| ast link |
	ast := (OrderedCollection >> #add:) ast.
	link := MetaLink new.
	link metaObject: Logger.
	link selector: #logAddCalled:by:method:sentTo:.
	link arguments: #(arguments sender context receiver).
	ast link: link.

	link uninstall
]

{ #category : #'as yet unclassified' }
DebuggingWithReflection class >> reifyingSender [

	| ast link |
	ast := (OrderedCollection >> #add:) ast.
	link := MetaLink new.
	link metaObject: Logger.
	link selector: #logAddCalled:by:.
	link arguments: #(arguments sender).
	ast link: link.

	link uninstall
]

{ #category : #'as yet unclassified' }
DebuggingWithReflection class >> simpleLogging [

	| ast link |
	ast := (OrderedCollection >> #add:) ast.
	link := MetaLink new.
	link metaObject: Logger.
	link selector: #logAddCalled.
	ast link: link.

	link uninstall
]
