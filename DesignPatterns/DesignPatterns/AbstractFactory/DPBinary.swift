//
//  DPBinary.swift
//  DesignPatterns
//
//  Created by Sourabh on 28/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
Specifies the type for a number that has to be coverted to binary format
*/
struct DPBinary: DPBaseNumber {
	
	/// To hold the decimal input value
	private var value: Int
	
	public static func getNumber(value: Int) -> DPBaseNumber {
		
		return DPBinary(value: value)
	}
	
	public func convertBase() -> String {
		
		// find the binary equivalent
		let binVal = String(value, radix: DPNumberBase.binary.rawValue)
		
		// calculate the padded length if the length is not a multiple of 4
		var padding = Int(ceil(Double(binVal.characters.count) / 4))
		padding = padding * 4 - binVal.characters.count
		
		// pad the beginning with zeros
		var result = String(repeating: "0", count: padding)
		
		// append the actual converted value
		result = result.appending(binVal)
		
		return result
	}
}
