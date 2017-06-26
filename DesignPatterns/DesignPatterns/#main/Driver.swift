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
		
		let traversable = DPStack<String>()
		
		let names = [
			"Sourabh",
			"Gagan",
			"Saksham",
			"Mommy"
		]
		
		for name in names {
			print("Inserting an element: \(name)")
			traversable.add(name)
		}
		
		print("Traversing the elements: ")
		traversable.traverse()
		
		while traversable.hasMore() {
			let element = traversable.remove() ?? "nil"
			print("Taking out an element: \(element)")
		}
		
	}
}
