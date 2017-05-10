//
//  ViewController.swift
//  FaceIt
//
//  Created by Sourabh on 08/05/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

	@IBOutlet weak var faceView: FaceView!
	
	@IBAction func updateScale(_ sender: UISlider) {
		faceView.scale = CGFloat(sender.value)
		faceView.setNeedsDisplay()
	}
	
	@IBAction func updateThickness(_ sender: UISlider) {
		faceView.lineWidth = CGFloat(sender.value)
		faceView.setNeedsDisplay()
	}
	
	@IBAction func updateCurvature(_ sender: UISlider) {
		faceView.mouthCurvature = CGFloat(sender.value)
		faceView.setNeedsDisplay()
	}
}

