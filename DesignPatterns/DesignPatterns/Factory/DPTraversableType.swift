//
//  DPTraversableType.swift
//  DesignPatterns
//
//  Created by Sourabh on 26/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
Specifies the behaviour of traversable object we want
- **Stack**: the traversable object to behave like a LIFO stack
- **Queue**: the traversable object to behave like a FIFO queue
- **Tree**: the traversable object to behave like a binary search tree
*/
enum DPTraversableBehaviour {
	/// the traversable object to behave like a LIFO stack
	case Stack
	/// the traversable object to behave like a FIFO queue
	case Queue
	/// the traversable object to behave like a binary search tree
	//case Tree
}

/**
This protocol has to be conformed by all objects that want to provide a traversable feature to the client.
*/
protocol DPTraversableType: class {
	
	/// the associated type to be used for actual element types
	associatedtype U
	
	/**
	This method adds an element of type `T` to the concrete traversable object, it changes the state of traversable object.
	- parameter element: A concrete object of type `T`
	*/
	func add(_ element: U)
	
	/**
	This method removes the last inserted element of type `T` from the concrete traversable object, if there is no last inserted element then it does not change the state of traversable object.
	- returns: A concrete object of type `T` or nil
	*/
	func remove() -> U?
	
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
