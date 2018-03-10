//
//  ViewController.swift
//  BullsEye
//
//  Created by Sourabh on 11/03/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func showAlert(_ sender: UIButton) {
		let alert = UIAlertController(
			title: "Hello World!",
			message: "This is my first app.",
			preferredStyle: .alert)
		
		let action = UIAlertAction(
			title: "Awesome", style: .default, handler: nil)
		
		alert.addAction(action)
		
		self.present(alert, animated: true, completion: nil)
	}
	
}

