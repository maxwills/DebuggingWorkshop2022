Class {
	#name : #InstrumentationUtilsMethodProxies,
	#superclass : #Object,
	#category : #'DebuggingWorkshop-Utils'
}

{ #category : #'as yet unclassified' }
InstrumentationUtilsMethodProxies class >> ex3_installLoggingWithMethodProxies [

	<script>
	self
		installInterceptorProxyIn: OrderedCollection >> #add:
		withBlock: [ :receiver :args | 
			| newObject |
			newObject := args first.
			newObject class = Egg ifTrue: [ 
				ALoggingTool log:
					'OrderedColleciton >> add: called from instrumentation (MethodProxy)' ] ]
]

{ #category : #'as yet unclassified' }
InstrumentationUtilsMethodProxies class >> installInterceptorProxyIn: aMethod withBlock: aBlockWithReceiverAndArgs [

	| mp handler |
	mp := MpMethodProxy
		      onMethod: aMethod
		      handler: (handler := MpInterceptor new interceptorBlock:
				                  aBlockWithReceiverAndArgs).
	mp install
]

{ #category : #cleanup }
InstrumentationUtilsMethodProxies class >> uninstallAll [

	<script>
	MpMethodProxy allInstances copy do: [ :mp | mp uninstall ]
]
