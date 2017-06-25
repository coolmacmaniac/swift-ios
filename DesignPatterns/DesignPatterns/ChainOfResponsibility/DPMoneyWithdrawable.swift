//
//  DPMoneyWithdrawable.swift
//  DesignPatterns
//
//  Created by Sourabh on 24/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
Specifies the denomination computation status
- **Invalid**: initial value or if the next chain does not exist
- **NotUsed**: chain may or may not exist but it was not used
- **Failed**: current chest failed, remaining chain failed
- **Successful**: current chest succeeded, remaining chain succeeded
*/
enum DPComputationStatus {
	/// initial value or if the next chain does not exist
	case Invalid
	/// chain may or may not exist but it was not used
	case NotUsed
	/// current chest failed, remaining chain failed
	case Failed
	/// current chest succeeded, remaining chain succeeded
	case Successful
}

/**
This protocol has to be conformed by all objects that want to participate
in currency denominaton computation to dispense the requested cash amount
*/
protocol DPMoneyWithdrawable: class {
	
	/**
	This function returns the total available denominations
	
	- returns: a value representing the face value along with the number of
				notes available
	*/
	func availableDenominations() -> String
	
	/**
	This function computes the denominations required to dispense the cash
	The computation takes care into account the total currency denominations
	currently available with the teller machine.

	- parameter amount: the amout of money to be withdrawn from the ATM
	- returns: a value from `DPComputationStatus` to represent if it is
				possible to withdraw the amount or not
	*/
	func computeDenominations(amount: Int) -> DPComputationStatus
	
	/**
	If it is possible to dispense the cash with current available cash
	denominations in the teller machine then this method shows the
	denominations that are used to dispense out the cash. Otherwise it retuns
	a proper error message.
	- Important: This method should be used after calling

			func computeDenominations(amount: Int) -> Bool

	- returns: if the computation was successful then the sequence of currency
				denominatons given out by the ATM, otherwise a proper error
				message for the kiosk
	*/
	func withdraw() -> String
	
}
