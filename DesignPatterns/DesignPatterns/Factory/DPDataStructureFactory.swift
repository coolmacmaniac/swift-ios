//
//  DPDataStructureFactory.swift
//  DesignPatterns
//
//  Created by Sourabh on 26/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
This class returns a traversable data structure of inherent type `T` with behaviour specified in `DPTraversableBehaviour`
*/
class DPDataStructureFactory<T> {
	
	/**
	Creates a data structure of type `DPTraversableType<T>` with behaviour specified in `DPTraversableBehaviour` enum
	- parameter type: the behaviour of type `DPTraversableBehaviour`
	- returns: the traversable data structure of type `DPTraversableType<T>`
	*/
	public func getDS(`as` type: DPTraversableBehaviour) -> DPTraversableType<T> {
		
		var object: DPTraversableType<T>
		switch type {
		case .Stack:	object = DPStack<T>()
		case .Queue:	object = DPQueue<T>()
		case .Tree:		object = DPBinaryTree<T>()
		}
		
		return object
	}
	
}
