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
	
	private var currentProgram = [Instructions]()
	
	private let operation: [String: Operation] = [
		"π": .Constant(Double.pi),
		"e": .Constant(M_E),
		"√": .UnaryOperation(sqrt),
		"±": .UnaryOperation({ -$0 }),
		"%": .UnaryOperation({ $0 / 100 }),
		"sq": .UnaryOperation({ $0 * $0 }),
		"×": .BinaryOperation({ $0 * $1 }),
		"÷": .BinaryOperation({ $0 / $1 }),
		"+": .BinaryOperation({ $0 + $1 }),
		"−": .BinaryOperation({ $0 - $1 }),
		"=": .Equals,
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
	
	public typealias Instructions = AnyObject
	
	public var program: Instructions {
		get {
			return currentProgram as CalculatorBrain.Instructions
		}
		set {
			if let program = newValue as? [AnyObject] {
				clearAll()
				for op in program {
					if let operand = op as? Double {
						setOperand(operand)
					} else if let symbol = op as? String {
						doOperation(symbol)
					}
				}
			}
		}
	}
	
	public var result: Double {
		get {
			return accumulator
		}
	}
	
	public func clearAll() {
		accumulator = 0.0
		pending = nil
		currentProgram.removeAll()
	}
	
	public func setOperand(_ operand: Double) {
		accumulator = operand
		currentProgram.append(operand as CalculatorBrain.Instructions)
	}
	
	public func doOperation(_ symbol: String) {
		currentProgram.append(symbol as CalculatorBrain.Instructions)
		
		switch operation[symbol]! {
		case .Constant(let value): accumulator = value
		case .UnaryOperation(let function):
			executePendingBinaryOperation()
			accumulator = function(accumulator)
		case .BinaryOperation(let function):
			executePendingBinaryOperation()
			pending = PendingBinaryOperationInfo(firstOperand: accumulator, function: function)
		case .Equals:
			executePendingBinaryOperation()
		}
	}
}
