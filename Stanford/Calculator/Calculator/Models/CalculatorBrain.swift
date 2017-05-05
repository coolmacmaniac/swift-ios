//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Sourabh on 03/05/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

public class CalculatorBrain {
	
	//MARK: - private members
	
	private var accumulator = 0.0
	
	private var pending: PendingBinaryOperationInfo?
	
	private let operation: [String: Operation] = [
		"π": .Constant(Double.pi),
		"e": .Constant(M_E),
		"√": .UnaryOperation(sqrt),
		"±": .UnaryOperation({ -$0 }),
		"×": .BinaryOperation({ $0 * $1 }),
		"÷": .BinaryOperation({ $0 / $1 }),
		"+": .BinaryOperation({ $0 + $1 }),
		"−": .BinaryOperation({ $0 - $1 }),
		"=": .Equals
	]
	
	private enum Operation {
		case Constant(Double)
		case UnaryOperation((Double) -> Double)
		case BinaryOperation((Double, Double) -> Double)
		case Equals
	}
	
	private struct PendingBinaryOperationInfo {
		var firstOperand: Double
		var function: (Double, Double) -> Double
	}
	
	private func executePendingBinaryOperation() {
		if nil != pending {
			accumulator = pending!.function(pending!.firstOperand, accumulator)
			pending = nil
		}
	}
	
	//MARK: - public members
	
	public func setOperand(_ operand: Double) {
		accumulator = operand
	}
	
	public func doOperation(_ symbol: String) {
		switch operation[symbol]! {
		case .Constant(let value): accumulator = value
		case .UnaryOperation(let function): accumulator = function(accumulator)
		case .BinaryOperation(let function):
			executePendingBinaryOperation()
			pending = PendingBinaryOperationInfo(firstOperand: accumulator, function: function)
		case .Equals:
			executePendingBinaryOperation()
		}
	}
	
	public var result: Double {
		get {
			return accumulator
		}
	}
}
