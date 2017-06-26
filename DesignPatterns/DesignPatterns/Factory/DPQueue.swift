//
//  DPQueue.swift
//  DesignPatterns
//
//  Created by Sourabh on 26/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class DPQueue<T>: DPTraversableType {
	
	/**
	A reference to the element of type `DPTraversableElement<T>` at the rear of the queue, may also be nil if the queue is empty
	*/
	private var rear: DPTraversableElement<T>?
	
	/**
	A reference to the element of type `DPTraversableElement<T>` at the front of the queue, may also be nil if the queue is empty
	*/
	private var front: DPTraversableElement<T>?
	
	init() {
		
		rear = nil
		front = nil
	}
	
	//MARK: - DPTraversableType methods
	
	public func add(_ element: T) {
		
		let object = DPTraversableElement<T>(value: element)
		
		// elements are inserted at the rear of the queue
		if nil != rear {
			// if there exists prior element, then refer to it as previous
			object.previous = rear
			rear!.next = object
		}
		
		// update the rear of queue
		rear = object
		
		// update the front of queue if this is the first insertion
		if nil == front {
			front = rear
		}
	}
	
	public func remove() -> T? {
		
		// elements are removed from the front of the queue
		if nil == front {
			// if the queue is empty then there is nothing to return
			return nil
		}
		
		// move the front of queue to the next element or nil if there isn't any
		let object = front
		front = front?.next
		object!.next = nil
		front?.previous = nil
		
		// update the rear as well if this was the last dequeue operation
		if nil == front {
			rear = front
		}
		
		// return the value in the current element
		return object!.value
	}
	
	public func hasMore() -> Bool {
		
		return nil != front
	}
	
	public func traverse() {
		
		var element = front
		while nil != element {
			print("[\(element!.value)]", terminator: "->")
			element = element?.next
		}
		print("[/]")
	}
	
}
