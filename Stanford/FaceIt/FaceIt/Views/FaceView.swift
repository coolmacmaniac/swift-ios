//
//  FaceView.swift
//  FaceIt
//
//  Created by Sourabh on 08/05/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class FaceView: UIView {
	
	// override draw() as we perform custom drawing
	override func draw(_ rect: CGRect) {
		
		let skullRadius = min(bounds.size.width, bounds.size.height) / 2
		let skullCenter = CGPoint(x: bounds.midX, y: bounds.midY)
		
		// create the circle path points
		let skull = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0.0, endAngle: CGFloat(2*Double.pi), clockwise: false)
		
		// set the line width
		skull.lineWidth = 5.0
		
		// set the stroke and fill colour
		UIColor.blue.set()
		
		// actuall draw the bezier path with above properties
		skull.stroke()
	}
	
}
