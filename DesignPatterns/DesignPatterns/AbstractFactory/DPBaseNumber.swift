//
//  DPBaseNumber.swift
//  DesignPatterns
//
//  Created by Sourabh on 28/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
To specify the base in which coversion is required
- **binary**: base 2
- **octal**: base 8
- **hexadecimal**: base 16
*/
enum DPNumberBase: Int {
	
	/// binary base
	case binary			= 2
	
	/// octal base
	case octal			= 8
	
	/// hexadecimal base
	case hexadecimal	= 16
}

/**
Specifies the base type for a number that has to be converted to a non decimal format
*/
protocol DPBaseNumber {
	
	/**
	This method has to be called to return a factory for more specialised implementation
	- parameter value: The decimal value that has to be converted to another format
	- returns: The factory method for the specialised implementation
	*/
	static func getNumber(value: Int) -> DPBaseNumber
	
	/**
	This method does the actual conversion
	- returns: The `String` representation of the converted value
	*/
	func convertBase() -> String
}

/**
 To be used as the return type of factory method of specialised implementations
*/
typealias DPNumberFactory = (Int) -> DPBaseNumber
