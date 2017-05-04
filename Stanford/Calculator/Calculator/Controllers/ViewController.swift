//
//  ViewController.swift
//  Calculator
//
//  Created by Sourabh on 02/05/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet private weak var display: UILabel!
	
	private var userIsInTheMiddleOfTyping = false
	
	private var brain = CalculatorBrain()
	
	private var displayValue: Double {
		get {
			return Double(display.text!)!
		}
		set {
			display.text = String(newValue)
		}
	}
	
	private var displayString: String {
		get {
			return display.text!
		}
		set {
			if display.text! == "0" && newValue == "0" {
				return
			}
			display.text = newValue
		}
	}
	
	@IBAction private func touchDigit(_ sender: UIButton) {
		let digit = sender.currentTitle!
		if userIsInTheMiddleOfTyping {
			displayString = displayString + digit
		} else {
			displayString = digit
			if displayString != "0" {
				userIsInTheMiddleOfTyping = true
			}
		}
	}
	
	@IBAction func performOperation(_ sender: UIButton) {
		userIsInTheMiddleOfTyping = false
		if let symbol = sender.currentTitle {
			brain.setOperand(displayValue)
			brain.doOperation(symbol)
			displayValue = brain.result
		}
	}
	
}

