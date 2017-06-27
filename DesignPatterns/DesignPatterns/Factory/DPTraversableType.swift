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
In programming there is a concept known as a **thunk** that can help us out with the shortcoming of generic protocols! A thunk is a helper struct/class that forwards calls from one object to another object. This is useful for scenarios where those two objects can't normally talk to one another. Using this, we can effectively erase our abstract generic protocol types in favor of another concrete, more fully-fledged type. This is often referred to as type erasure.

By creating a class that conforms to our original protocol and uses generics, we can more explicitly define our protocol's associated type.
*/
class DPTraversableType<T>: DPTraversable {
	
	// type erasure
	typealias TypeName = T
	
	//MARK: - DPTraversable type erasure default implementations
	
	public func add(_ element: T) {
		
		// needs to be overridden by the actual implementation class
	}
	
	public func remove() -> T? {
		
		// needs to be overridden by the actual implementation class
		return nil
	}
	
	public func hasMore() -> Bool {
		
		// needs to be overridden by the actual implementation class
		return false
	}
	
	public func traverse() {
		
		// needs to be overridden by the actual implementation class
	}
}
