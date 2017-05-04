//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Sourabh on 03/05/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

public class CalculatorBrain {
	
	private var accumulator = 0.0
	
	public func setOperand(_ operand: Double) {
		accumulator = operand
	}
	
	private let operation: [String: Operation] = [
		"π": .Constant(Double.pi),
		"e": .Constant(M_E),
		"√": .UnaryOperation(sqrt)
	]
	
	private enum Operation {
		case Constant(Double)
		case UnaryOperation((Double) -> Double)
		case BinaryOperation((Double, Double) -> Double)
		case Equals
	}
	
	public func doOperation(_ symbol: String) {
		switch operation[symbol]! {
		case .Constant(let value): accumulator = value
		case .UnaryOperation(let function): accumulator = function(accumulator)
		default: break
		}
	}
	
	public var result: Double {
		get {
			return accumulator
		}
	}
}
