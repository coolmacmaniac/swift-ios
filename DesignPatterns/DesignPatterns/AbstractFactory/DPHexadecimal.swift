//
//  DPHexadecimal.swift
//  DesignPatterns
//
//  Created by Sourabh on 28/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
Specifies the type for a number that has to be coverted to hexadecimal format
*/
struct DPHexadecimal: DPBaseNumber {
	
	/// To hold the decimal input value
	private var value: Int
	
	public static func getNumber(value: Int) -> DPBaseNumber {
		
		return DPHexadecimal(value: value)
	}
	
	public func convertBase() -> String {
		
		// find the hex equivalent in uppercase
		let hexVal = String(value, radix: DPNumberBase.hexadecimal.rawValue).uppercased()
		
		// calculate the padded length if the length is not a multiple of 4
		var padding = Int(ceil(Double(hexVal.characters.count) / 4))
		padding = padding * 4 - hexVal.characters.count
		
		// add the hex indicator '0x' in the beginning
		var result = "0x"
		
		// pad the beginning with zeros
		result = result.appending(String(repeating: "0", count: padding))
		
		// append the actual converted value
		result = result.appending(hexVal)
		
		return result
	}
}
