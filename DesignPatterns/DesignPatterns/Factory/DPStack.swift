//
//  DPStack.swift
//  DesignPatterns
//
//  Created by Sourabh on 26/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class DPStack<T>: DPTraversableType {
	
	/**
	A reference to the element of type `DPTraversableElement<T>` at the top of the stack, may also be nil if the stack is empty
	*/
	private var top: DPTraversableElement<T>?
	
	init() {
		
		top = nil
	}
	
	//MARK: - DPTraversableType methods
	
	public func add(_ element: T) {
		
		let object = DPTraversableElement<T>(value: element)
		
		if nil != top {
			// if there exists prior element, then refer to it as previous
			object.previous = top
		}
		
		// update the top of stack
		top = object
	}
	
	public func remove() -> T? {
		
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
	
	public func hasMore() -> Bool {
		
		return nil != top
	}
	
	public func traverse() {
		
		var element = top
		while nil != element {
			print("[\(element!.value)]", terminator: "->")
			element = element?.previous
		}
		print("[/]")
	}
	
}
