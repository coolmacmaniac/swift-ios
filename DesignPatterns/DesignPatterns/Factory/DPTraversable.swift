//
//  DPTraversable.swift
//  DesignPatterns
//
//  Created by Sourabh on 27/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
This protocol has to be conformed by the base class of all those classes that provide a traversable data structure to the client.
*/
protocol DPTraversable: class {
	
	/// the associated type to be used for actual element types
	associatedtype TypeName
	
	/**
	This method adds an element of abstract type `TypeName` to the concrete traversable object, it changes the state of traversable object.
	- parameter element: A concrete object of abstract type `TypeName`
	*/
	func add(_ element: TypeName)
	
	/**
	This method removes the last inserted element of abstract type `TypeName` from the concrete traversable object, if there is no last inserted element then it does not change the state of traversable object.
	- returns: A concrete object of abstract type `TypeName` or nil
	*/
	func remove() -> TypeName?
	
	/**
	This method specifies if there exist more elements in the traversable object.
	- returns: true if there are more elements, false otherwise
	*/
	func hasMore() -> Bool
	
	/**
	This method traverses all the elements in a well defined order according to the traversable object's behaviour.
	*/
	func traverse()
}
