//
//  DPAutomatedTellerMachine.swift
//  DesignPatterns
//
//  Created by Sourabh on 24/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/// This class simulates an ATM machine
class DPAutomatedTellerMachine {
	
	/// Specifies all the available currency denominations
	private enum DenominationTypes: Int {
		case One			= 1
		case Two			= 2
		case Five			= 5
		case Ten			= 10
		case Twenty			= 20
		case Fifty			= 50
		case Hundred		= 100
		case FiveHundred	= 500
		case TwoThousand	= 2000
	}
	
	/// Specifies the sequence of all available currency denominations
	private static let denominations: Array<DenominationTypes> = [
		.One,
		.Two,
		.Five,
		.Ten,
		.Twenty,
		.Fifty,
		.Hundred,
		.FiveHundred,
		.TwoThousand
	]
	
	/**
	Provides the total number of notes of the specified currency denomination
	- parameter denomination: any of those available in `DenominationTypes`
	- returns: total number of notes of the specified denomination
	*/
	private static func notesFor(_ denomination: DenominationTypes) -> Int {
		switch denomination {
		case .One:			return 7
		case .Two:			return 4
		case .Five:			return 3
		case .Ten:			return 6
		case .Twenty:		return 4
		case .Fifty:		return 4
		case .Hundred:		return 5
		case .FiveHundred:	return 3
		case .TwoThousand:	return 2
		}
	}
	
	/// Chest with highest available currency denomination
	private let cashDispenser: DPCurrencyChest
	
	init() {
		
		var nextInChain: DPCurrencyChest?
		var currencyChest: DPCurrencyChest?
		
		for denomination in DPAutomatedTellerMachine.denominations {
			
			currencyChest = DPCurrencyChest(
				faceValue: denomination.rawValue,
				availableNotes: DPAutomatedTellerMachine.notesFor(denomination),
				nextChestInChain: nextInChain
			)
			
			nextInChain = currencyChest
			
		}
		
		self.cashDispenser = currencyChest!
	}
	
	/**
	Shows the denominations if it is possible to dispense the cash. Otherwise
	it retuns a proper error message.
	- parameter amount: the amount that needs to be withdrawn from the ATM
	- returns: the sequence of currency denominatons given out by the ATM, or a proper error message for the kiosk
	*/
	public func withdrawCash(amount: Int) -> String {
		
		print("============ATM Before==============")
		print(self.cashDispenser.availableDenominations(), terminator: "")
		print("============ATM After===============")
		_ = self.cashDispenser.computeDenominations(amount: amount)
		let cash = self.cashDispenser.withdraw()
		print(self.cashDispenser.availableDenominations(), terminator: "")
		print("====================================")
		return cash
	}
}
