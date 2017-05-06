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
	
	@IBOutlet private weak var squareButton: UIButton!
	
	@IBOutlet weak var orientationStack: UIStackView!
	
	@IBOutlet weak var mathematicalStack: UIStackView!
	
	private var userIsInTheMiddleOfTyping = false
	
	private var brain = CalculatorBrain()
	
	private var savedProgram: CalculatorBrain.Instructions?
	
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
	
	private var displayStringHasDot: Bool {
		return displayString.contains(".")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		// customise display font to digital font
		display.font = UIFont(name: "DBLCDTempBlack", size: 40.0);
		
		// customise superscript for square button
		let mainFont = UIFont.systemFont(ofSize: 25.0)
		let superFont = UIFont.systemFont(ofSize: 12.0)
		//let color = UIColor(colorLiteralRed: 6.0/255.0, green: 76.0/255.0, blue: 150.0/255.0, alpha: 1.0)
		let color = UIColor.white
		let squareStr = NSMutableAttributedString(string: (squareButton.titleLabel?.text)!, attributes: [NSFontAttributeName: mainFont, NSForegroundColorAttributeName: color])
		squareStr.setAttributes([NSFontAttributeName: superFont, NSBaselineOffsetAttributeName: 10, NSForegroundColorAttributeName: color], range:NSRange(location: 1, length: 1))
		squareButton.setAttributedTitle(squareStr, for: .normal)
		
		// customise round corners for display
		display.layer.cornerRadius = 5.0
		display.clipsToBounds = true
		
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		if UIDevice.current.orientation.isLandscape {
			// rotating to landscape orientation
			orientationStack.axis = .horizontal
			mathematicalStack.axis = .vertical
			orientationStack.insertArrangedSubview(mathematicalStack, at: orientationStack.subviews.endIndex)
		} else {
			// rotating to portrait orientation
			orientationStack.axis = .vertical
			mathematicalStack.axis = .horizontal
			orientationStack.insertArrangedSubview(mathematicalStack, at: orientationStack.subviews.startIndex)
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
	
	@IBAction private func performOperation(_ sender: UIButton) {
		userIsInTheMiddleOfTyping = false
		if let symbol = sender.currentTitle {
			brain.setOperand(displayValue)
			brain.doOperation(symbol)
			displayValue = brain.result
		}
	}
	
	@IBAction private func touchDot(_ sender: UIButton) {
		guard !displayStringHasDot else {
			return
		}
		let digit = sender.currentTitle!
		displayString = displayString + digit
		userIsInTheMiddleOfTyping = true
	}
	
	@IBAction func doSaveCalculations() {
		
		// save brains state here & clear from brain
		savedProgram = brain.program
	}
	
	@IBAction func doPlayCalaulations() {
		
		// load state from here into brain & start playing
		if let savedProgram = savedProgram {
			brain.program = savedProgram
			
			// update the result on UI
			displayValue = brain.result
		}
	}
	
	@IBAction func doClearCalaulations() {
		
		// clear the brain
		brain.clearAll()
		
		// clear the cache
		savedProgram = nil
		
		// clear the display
		displayValue = brain.result
	}
}

