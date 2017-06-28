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
class DPDataStructureFactory {
	
	/**
	Creates a data structure of type `DPTraversableType<T>` of elements of type specified by `T` and with behaviour specified in `DPTraversableBehaviour` enum
	- parameter behaviour: the behaviour of type `DPTraversableBehaviour` like stack, queue or tree
	- parameter type: the type of elements to be used specified dynamically by `T.Type`
	- returns: the traversable data structure of type `DPTraversableType<T>`
	*/
	public static func getDS<T: Comparable>(`as` behaviour: DPTraversableBehaviour, of type: T.Type) -> DPTraversableType<T> {
		var object: DPTraversableType<T>
		switch behaviour {
		case .Stack:	object = DPStack<T>()
		case .Queue:	object = DPQueue<T>()
		case .Tree:		object = DPBinaryTree<T>()
		}
		
		return object
	}
}
