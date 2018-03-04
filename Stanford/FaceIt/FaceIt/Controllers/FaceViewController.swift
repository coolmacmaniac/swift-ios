//
//  ViewController.swift
//  FaceIt
//
//  Created by Sourabh on 08/05/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {
	
	override func viewDidAppear(_ animated: Bool) {
		
		/*addObserver(
			self,
			forKeyPath: #keyPath(faceView.skullRadius),
			options: nil,
			context: nil
		)*/
		
		addObserver(self, forKeyPath: #keyPath(faceView.skullRadius), options: [NSKeyValueObservingOptionNew, NSKeyValueObservingOptionOld], context: nil)
		
	}
	
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		
	}

	override func viewDidDisappear(_ animated: Bool) {
		
		removeObserver(
			self,
			forKeyPath: #keyPath(faceView.skullRadius)
		)
	}
	
	// it is a value type and any change in its member properties automatically
	// triggers didSet on this type as well, this is not possible in case of
	// classes
	private var expression = FacialExpression(
		eyes: .Open,
		eyeBrows: .Relaxed,
		mouth: .Smile
	) {
		didSet {
			// not called during initializations
			updateUI()
		}
	}
	
	@IBOutlet weak var faceView: FaceView! {
		didSet {
			// can add gesture recognizers for those cases where the value is
			// changed only within the view, not within the model
			// if the value within the model is changed then the gesture recognizer
			// can be added to the view controller instead of the view itself
			
			faceView.addGestureRecognizer(UIPinchGestureRecognizer(
				target: faceView, action: #selector(FaceView.changeScale(_:))
			))
			
			let happierSwipeGestureRecognizer = UISwipeGestureRecognizer(
				target: self, action: #selector(FaceViewController.increaseHappiness)
			)
			happierSwipeGestureRecognizer.direction = .down
			faceView.addGestureRecognizer(happierSwipeGestureRecognizer)
			
			let sadderSwipeGestureRecognizer = UISwipeGestureRecognizer(
				target: self, action: #selector(FaceViewController.decreaseHappiness)
			)
			sadderSwipeGestureRecognizer.direction = .up
			faceView.addGestureRecognizer(sadderSwipeGestureRecognizer)
			
			updateUI()
		}
	}
	
	private let eyebrowTilts = [FacialExpression.EyeBrows.Relaxed: 1.0,
	                            .Normal: 0.0,
	                            .Furrowed: -1.0]
	
	private let mouthCurvatures = [FacialExpression.Mouth.Smile: 1.0,
	                               .Grin: 0.5,
	                               .Normal: 0.0,
	                               .Smirk: -0.5,
	                               .Frown: -1.0]
	
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
	
	private func updateUI() {
		
		switch expression.eyes {
		case .Open: faceView.eyesOpen = true
		case .Closed: faceView.eyesOpen = false
		case .Squinting: faceView.eyesOpen = false
		}
		
		faceView.eyebrowTilt = CGFloat(eyebrowTilts[expression.eyeBrows]!)
		faceView.mouthCurvature = CGFloat(mouthCurvatures[expression.mouth]!)
	}
	
	// need to be public so as to be visible to objective-c
	public func increaseHappiness() {
		expression.mouth = expression.mouth.happierMouth()
	}
	
	// need to be public so as to be visible to objective-c
	public func decreaseHappiness() {
		expression.mouth = expression.mouth.sadderMouth()
	}
	
	@IBAction func toggleEyes(_ recognizer: UITapGestureRecognizer) {
		if recognizer.state == .ended {
			switch expression.eyes {
			case .Open: expression.eyes = .Closed
			case .Closed: expression.eyes = .Open
			case .Squinting: break
			}
		}
	}
	
	@IBAction func relaxEyebrows(_ recognizer: UIRotationGestureRecognizer) {
		switch recognizer.state {
		case .changed, .ended:
			if recognizer.rotation > 0.0 {
				expression.eyeBrows = expression.eyeBrows.moreRelaxedBrows()
			} else {
				expression.eyeBrows = expression.eyeBrows.moreFurrowedBrows()
			}
		default: break
		}
	}
	
	@IBAction func frownEyebrows(_ sender: UIRotationGestureRecognizer) {
	}
}

