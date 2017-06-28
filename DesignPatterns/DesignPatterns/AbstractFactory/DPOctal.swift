//
//  DPOctal.swift
//  DesignPatterns
//
//  Created by Sourabh on 28/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
Specifies the type for a number that has to be coverted to octal format
*/
struct DPOctal: DPBaseNumber {
	
	/// To hold the decimal input value
	private var value: Int
	
	public static func getNumber(value: Int) -> DPBaseNumber {
		
		return DPOctal(value: value)
	}
	
	public func convertBase() -> String {
		
		// find the octal equivalent
		let octVal = String(value, radix: DPNumberBase.octal.rawValue)
		
		// calculate the padded length if the length is not a multiple of 3
		var padding = Int(ceil(Double(octVal.characters.count) / 3))
		padding = padding * 3 - octVal.characters.count
		
		// pad the beginning with zeros, with one added zero for octal indication
		var result = String(repeating: "0", count: padding + 1)
		
		// append the actual converted value
		result = result.appending(octVal)
		
		return result
	}
}
