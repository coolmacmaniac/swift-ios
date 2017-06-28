//
//  Driver.swift
//  DesignPatterns
//
//  Created by Sourabh on 24/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class Driver {
	
	class func testAllDesignPatterns() {
		
//		testChainOfResponsibility()
		testFactory()
		
	}
	
	private class func testChainOfResponsibility() {
		
		let atm = DPAutomatedTellerMachine()
		
		let requestedCashList = [
			640,
			2400,
			3150,
			179,
			10
		]
		
		var cash: String!
		for requestedCash in requestedCashList {
			print("Withdrawing cash = INR \(requestedCash)")
			cash = atm.withdrawCash(amount: requestedCash)
			print("Dispensed denominations:", cash, separator: "\n", terminator: "")
			print("====================================", terminator: "\n\n")
		}
	}
	
	private class func testFactory() {
		
		let dsTypes = [
			DPTraversableBehaviour.Stack,
			DPTraversableBehaviour.Queue,
			DPTraversableBehaviour.Tree
		]
		
		let values = [
			"Sourabh",
			"Gagan",
			"Saksham",
			"Mommy"
		]
		
//		let values = [
//			31,
//			97,
//			43,
//			29
//		]
		
		let elementType = type(of: values).Element.self
		
		for dsType in dsTypes {
			
			let traversable = DPDataStructureFactory.getDS(as: dsType, of: elementType)
			
			print("===============\(dsType)================")
			for value in values {
				print("Inserting an element: \(value)")
				traversable.add(value)
			}
			
			print("Traversing the elements: ")
			traversable.traverse()
			
			while traversable.hasMore() {
				let element = traversable.remove()!
				print("Taking out an element: \(element)")
			}
			
			print("====================================", terminator: "\n\n")
		}
	}
}
