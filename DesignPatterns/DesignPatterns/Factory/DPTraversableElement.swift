//
//  DPTraversableElement.swift
//  DesignPatterns
//
//  Created by Sourabh on 26/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
Specifies the type of element that needs to be used in traversable objects
*/
class DPTraversableElement<T> {
	
	/**
	The inherent value that is saved, retrieved and traversed in by the traversable objects, its type `T` is supplied at run time.
	*/
	let value: T
	
	/**
	Specifies the previous element in the traversable object, it holds the references to the similar `DPTraversableElement<T>` objects, and may also be nil.
	*/
	var previous: DPTraversableElement<T>?
	
	/**
	Specifies the next element in the traversable object, it holds the references to the similar `DPTraversableElement<T>` objects, and may also be nil.
	*/
	var next: DPTraversableElement<T>?
	
	/**
	Initializes with a value of type `T` and also provides the directional references for the current element
	- parameter previous: a reference to the previous element of type `DPTraversableElement<T>`, defaults to nil
	- parameter next: a reference to the next element of type `DPTraversableElement<T>`, defaults to nil
	*/
	init(value: T, previous: DPTraversableElement<T>? = nil, next: DPTraversableElement<T>? = nil) {
		
		self.value = value
		self.previous = previous
		self.next = next
	}
	
}
