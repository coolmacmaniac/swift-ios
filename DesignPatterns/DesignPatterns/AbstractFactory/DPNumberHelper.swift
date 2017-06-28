//
//  DPNumberHelper.swift
//  DesignPatterns
//
//  Created by Sourabh on 28/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

/**
The wrapper type to return the factory methods of base specific implementations
*/
struct DPNumberHelper {
	
	/**
	Returns the factory methods of binary, octal and hexadecimal implementation types
	- parameter base: takes the base of type `DPNumberBase` as input in which conversion is required
	- returns: the factory method of type `DPNumberFactory` for concrete implementation
	*/
	public static func factory(withBase base: DPNumberBase) -> DPNumberFactory {
		
		var type: DPBaseNumber.Type!
		
		switch base {
		case .binary:		type = DPBinary.self
		case .octal:		type = DPOctal.self
		case .hexadecimal:	type = DPHexadecimal.self
		}
		
		return type.getNumber
	}
	
}
