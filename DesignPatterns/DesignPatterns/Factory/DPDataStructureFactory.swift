//
//  DPDataStructureFactory.swift
//  DesignPatterns
//
//  Created by Sourabh on 26/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class DPDataStructureFactory<T> {
	
	public static func traversableObject(`as` type: DPTraversableBehaviour) -> DPTraversableType {
		
		typealias U = T
		
		var object: DPTraversableType
		switch type {
		case .Stack:	object = DPStack<T>()
		case .Queue:	object = DPQueue<T>()
		}
		
		return object
	}
	
}
