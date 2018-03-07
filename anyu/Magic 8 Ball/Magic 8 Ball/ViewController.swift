//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Sourabh on 08/03/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
	var randomBallNumber = 0

	@IBOutlet weak var ivw_ball: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		newBallImage()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func askButtonPressed(_ sender: UIButton) {
		newBallImage()
	}
	
	func newBallImage() {
		randomBallNumber = Int(arc4random_uniform(4)) + 1
		ivw_ball.image = UIImage(named: ballArray[randomBallNumber])
	}
	
	override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
		newBallImage()
	}
}

