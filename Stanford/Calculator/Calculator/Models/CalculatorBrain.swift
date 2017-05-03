//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Sourabh on 03/05/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

public class CalculatorBrain {
	
	private var accumulator: Double = 0.0
	
	public func setOperand(_ operand: String) -> Void {
		accumulator = Double(operand)!
	}
	
	public func doOperation(_ symbol: String) -> Void {
		switch symbol {
		case "π": accumulator = Double.pi
		case "e": accumulator = M_E
		case "√": accumulator = sqrt(accumulator)
		default: break
		}
	}
	
	public var result: String {
		get {
			return String(accumulator)
		}
	}
}
