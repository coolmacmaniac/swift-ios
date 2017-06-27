//
//  DPStack.swift
//  DesignPatterns
//
//  Created by Sourabh on 26/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
Stack implementation of traversable data structure of type `DPTraversableType<T>`
*/
class DPStack<T>: DPTraversableType<T> {
	
	/**
	A reference to the element of type `DPTraversableElement<T>` at the top of the stack, may also be nil if the stack is empty
	*/
	private var top: DPTraversableElement<T>?
	
	override init() {
		
		top = nil
	}
	
	//MARK: - DPTraversableType methods
	
	public override func add(_ element: T) {
		
		let object = DPTraversableElement<T>(value: element)
		
		if nil != top {
			// if there exists prior element, then refer to it as previous
			object.previous = top
		}
		
		// update the top of stack
		top = object
	}
	
	public override func remove() -> T? {
		
		if nil == top {
			// if the stack is empty then there is nothing to return
			return nil
		}
		
		// move the top of stack to the previous element or nil if there isn't any
		let object = top
		top = top?.previous
		object?.previous = nil
		
		// return the value in the current element
		return object!.value
	}
	
	public override func hasMore() -> Bool {
		
		return nil != top
	}
	
	public override func traverse() {
		
		var element = top
		while nil != element {
			print("[\(element!.value)]", terminator: "->")
			element = element?.previous
		}
		print("[/]")
	}
	
}
