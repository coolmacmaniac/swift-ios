//
//  DPBinaryTree.swift
//  DesignPatterns
//
//  Created by Sourabh on 28/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
Binary tree implementation of traversable data structure of type `DPTraversableType<T>` where `T` has to conform to `Comparable` protocol
*/
class DPBinaryTree<T: Comparable>: DPTraversableType<T> {

	/**
	A reference to the element of type `DPTraversableElement<T>` at the root node, may also be nil if the tree does not exist
	*/
	private var node: DPTraversableElement<T>?
	
	override init() {
		
		node = nil
	}
	
	/// Tells the result of comparison of two string objects lexicographically
	private enum Compared {
		/// If the two strings are equal
	case Equal
		/// If the first string appears before the right string in dictionary
	case Lesser
		/// If the first string appears after the right string in dictionary
	case Greater
	}
	
	/**
	Compares two objects of `Comparable` types `T` lexicographically by ignoring the case
	- parameter first: the first object to be compared
	- parameter second: the second object to be compared
	- returns: any of the values specified in `Compared` enum
	*/
	private func compare(_ first: T, with second: T) -> Compared {
		
		if T.self == String.self {
			let result = (first as! String).caseInsensitiveCompare(second as! String)
			switch  result {
			case .orderedSame:			return .Equal
			case .orderedAscending:		return .Lesser
			case .orderedDescending:	return .Greater
			}
		}
		else {
			if first < second {
				return .Lesser
			} else if first > second {
				return .Greater
			} else {
				return .Equal
			}
		}
	}
	
	//MARK: - DPTraversableType methods
	
	public override func add(_ element: T) {
		
		let object = DPTraversableElement<T>(value: element)
		
		if nil == node {
			// this is first node the root node in the tree
			node = object
			return
		}
		
		// elements have already been inserted in the tree
		var parent: DPTraversableElement<T>? = nil
		var child = node
		
		// search for the place where this element can be inserted
		var compRes = Compared.Equal
		while nil != child {
			compRes = self.compare(object.value, with: child!.value)
			switch compRes {
			case .Lesser:
				// object should be on the left subtree
				parent = child
				child = child?.previous
			case .Greater:
				// object should be on the right subtree
				parent = child
				child = child?.next
			default:
				// no need to insert as this value already exists in the tree
				return
			}
		}
		
		// if the object was lesser
		if .Lesser == compRes {
			parent!.previous = object
		} else {
			parent!.next = object
		}
	}
	
	public override func remove() -> T? {
		
		if nil == node {
			// if the tree is empty then there is nothing to return
			return nil
		}
		
		// elements have already been inserted in the tree
		var parent: DPTraversableElement<T>? = nil
		var child = node
		
		// search for the smallest or lexicographically fist node in the tree
		while nil != child?.previous {
			parent = child
			child = child?.previous
		}
		
		// the child has no left subtree
		if let parent = parent {
			// if the parent exists then set the child's right subtree as the parent's left subtree
			parent.previous = child!.next
		} else {
			// otherwise set the child's right subtree as the root node
			node = child!.next
		}
		
		// detach the remaining referene in child
		child!.next = nil
		
		// return the value in the current element
		return child!.value
	}
	
	public override func hasMore() -> Bool {
		
		return nil != node
	}
	
	public override func traverse() {
		
		// a stack is required to keep the visited nodes for inorder traversal
		let stack = DPStack<DPTraversableElement<T>>()
		
		var element = node
		repeat {
			
			// move to a node which does not have a left subtree
			// while doing that keep the visited nodes on a stack
			while nil != element {
				stack.add(element!)
				element = element!.previous
			}
			
			// pop the recently visited leaf node out of the stack & print it
			element = stack.remove()
			print("[\(element!.value)]", terminator: "->")
			
			// move to the right node of the visited node to traverse it in inorder
			element = element!.next
			
			// repeat while we have nodes left in stack or the right subtree of visited node exists
		} while stack.hasMore()	|| nil != element
		
		print("[/]")
	}
	
}
