//
//  ViewController.swift
//  BullsEye
//
//  Created by Sourabh on 11/03/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var targetValue = 0
	var currentValue = 0
	var score = 0
	var round = 0
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var roundLabel: UILabel!
	
	//Drongo@123
	
	override func viewDidLoad() {
		super.viewDidLoad()
		startNewRound()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func sliderMoved(_ slider: UISlider) {
		currentValue = lroundf(slider.value)
		//print("Val: \(slider.value), Int: \(Int(slider.value)), lroundf: \(lroundf(slider.value))")
	}
	
	@IBAction func showAlert(_ sender: UIButton) {
		
		let difference = abs(targetValue - currentValue)
		var points = 100 - difference
		
		// bonus points
		if difference == 0 {
			points += 100		// 100 extra bonus
		} else if difference == 1 {
			points += 50		// 50 extra bonus
		}
		
		// compute overall score
		score += points
		
		let title: String
		if difference == 0 {
			title = "Perfect!!"
		} else if difference < 5 {
			title = "You almost had it!"
		} else if difference < 10 {
			title = "Pretty good!"
		} else {
			title = "Oh! that wasn't close..."
		}
		
		let alert = UIAlertController(
			title: title,
			message: "You scored \(points) points",
			preferredStyle: .alert)
		
		let action = UIAlertAction(
			title: "Close", style: .default, handler: popupHandler)
		
		alert.addAction(action)
		
		self.present(alert, animated: true, completion: nil)
	}
	
	// MARK: -
	
	func popupHandler(_ action: UIAlertAction) {
		startNewRound()
	}
	
	func updateLabels() {
		targetLabel.text = String(targetValue)
		scoreLabel.text = String(score)
		roundLabel.text = String(round)
	}
	
	func startNewRound() {
		round += 1
		targetValue = 1 + Int(arc4random_uniform(100))
		currentValue = 50
		slider.value = Float(currentValue)
		updateLabels()
	}
	
	
}

