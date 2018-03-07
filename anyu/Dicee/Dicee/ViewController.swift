//
//  ViewController.swift
//  Dicee
//
//  Created by Sourabh on 05/03/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var randomDiceIndex1: Int = 0
	var randomDiceIndex2: Int = 0
	
	@IBOutlet var ivwDice1: UIImageView!
	@IBOutlet var ivwDice2: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateDiceImages()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func rollButtonTapped(_ sender: UIButton) {
		updateDiceImages()
	}
	
	func updateDiceImages() {
		randomDiceIndex1 = Int(arc4random_uniform(6)) + 1
		randomDiceIndex2 = Int(arc4random_uniform(6)) + 1
//		print(randomDiceIndex1, randomDiceIndex2)
		ivwDice1.image = UIImage(named: "dice\(randomDiceIndex1)")
		ivwDice2.image = UIImage(named: "dice\(randomDiceIndex2)")
	}
	
	override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
		updateDiceImages()
	}

}

