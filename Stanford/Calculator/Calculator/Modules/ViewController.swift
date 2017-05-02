//
//  ViewController.swift
//  Calculator
//
//  Created by Sourabh on 02/05/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var display: UILabel?
	
	@IBAction func touchDigit(_ sender: UIButton) {
		let digit = sender.currentTitle!
		let textCurrentlyInDisplay = display!.text!
		let value = Int(textCurrentlyInDisplay + digit)!
		if 0 != value {
			display?.text = String(value)
		}
	}
	
	
}

