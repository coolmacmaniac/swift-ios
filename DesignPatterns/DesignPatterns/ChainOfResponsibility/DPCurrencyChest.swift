//
//  DPCurrencyChest.swift
//  DesignPatterns
//
//  Created by Sourabh on 24/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
This is the chest with one type of currency denomination. It is responsible
for computing its currency that can contribute to the total amount that is
required to be dispensed by the teller machine. If it is exhausted of its
available currency or it is not possible to use its currency to dispense the
cash like if the required amount is less than the minimum face value of its
currency denomination then it passes on the responsibility to the next lower
currency chest in sequence. If it is the last currency chest with lowest
possible denomination then it returns with error message.

It conforms to `DPMoneyWithdrawable` protocol.
*/
class DPCurrencyChest: DPMoneyWithdrawable {
	
	/// proper error message to be returned
	private static let kErrorMessage = "Unable to dispense cash\n"
	
	/// the face value of the currency denomination available with this chest
	private let faceValue: Int
	
	/// total number of currency notes that this chest holds as of now
	private var availableNotes: Int
	
	/// the next lower currency chest in chain for this chest
	private var nextChestInChain: DPCurrencyChest?
	
	/// the number of currency notes used from this chest to dispense cash
	private var notesConsumed: Int
	
	/// the cash dispensable status of the remaining chain
	private var chainStatus: DPComputationStatus
	
	/**
	- parameters:
		- faceValue:
			the face value of the currency denomination available with this chest
		- availableNotes:
			total number of currency notes that this chest holds as of now
		- nextChestInChain:
			the next lower currency chest in chain for this chest
	*/
	init(faceValue: Int, availableNotes: Int, nextChestInChain: DPCurrencyChest?) {
		self.faceValue = faceValue
		self.availableNotes = availableNotes
		self.nextChestInChain = nextChestInChain
		self.notesConsumed = 0
		self.chainStatus = ( nil != nextChestInChain ) ? .NotUsed : .Invalid
	}
	
	//MARK: - DPMoneyWithdrawable
	
	func availableDenominations() -> String {
		
		var current = ""
		var next: String?
		
		// denominations available from the remaining chain
		if let nextChest = self.nextChestInChain {
			next = nextChest.availableDenominations()
		}
		
		// denominations from the current chest
		if 0 < self.availableNotes {
			current.append("\(self.faceValue) * \(self.availableNotes) = \(self.faceValue * self.availableNotes)\n")
		}
		
		current.append(next ?? "")
		
		return current
	}
	
	func computeDenominations(amount: Int) -> DPComputationStatus {
		
		var amount = amount
		self.notesConsumed = 0
		self.chainStatus = ( nil != nextChestInChain ) ? .NotUsed : .Invalid
		
		while self.faceValue <= amount && 0 < self.availableNotes {
			
			self.notesConsumed += 1		// notes are kept aside to dispense
			self.availableNotes -= 1	// total notes availability is impacted
			amount -= self.faceValue	// amount is updated for next cycle
		}
		
		if 0 < amount {
			// if there is any lower denomination currency available then ask
			// the next chest in chain to compute its notes to dispense cash
			if let nextChest = self.nextChestInChain {
				self.chainStatus = nextChest.computeDenominations(amount: amount)
				return self.chainStatus
			} else {
				// it is not possible to dispense the cash as the currency
				// combination is not available
				self.chainStatus = .Failed
				return self.chainStatus
			}
		}
		
		// all the required amount has been dispensed
		return .Successful
	}
	
	func withdraw() -> String {
		
		// check if the cash dispensable status of the remaining chain is false
		// then return the error message returned from there
		if .Failed == self.chainStatus {
			
			// the process failed, reset the notes kept aside
			self.availableNotes += self.notesConsumed
			self.notesConsumed = 0
			
			if let nextChest = self.nextChestInChain {
				return nextChest.withdraw()
			} else {
				return DPCurrencyChest.kErrorMessage
			}
		}
		
		var current = ""
		var next: String?
		
		// otherwise check if the current cash dispensable status is true
		// then fetch the denominations from the remaining chain
		if .Successful == self.chainStatus {
			if let nextChest = self.nextChestInChain {
				next = nextChest.withdraw()
			}
		}
		
		// if current denomination was used then append the status of current chest
		if 0 < self.notesConsumed {
			current.append("\(self.faceValue) * \(self.notesConsumed) = \(self.faceValue * self.notesConsumed)\n")
		}
		
		current.append(next ?? "")
		
		return current
	}
}
