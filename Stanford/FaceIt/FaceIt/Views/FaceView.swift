//
//  FaceView.swift
//  FaceIt
//
//  Created by Sourabh on 08/05/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class FaceView: UIView {
	
	public var scale: CGFloat = 0.45
	public var lineWidth: CGFloat = 5.0
	public var mouthCurvature: CGFloat = 0.0
	
	private struct Ratios {
		static let SkullRadiusToEyeOffset: CGFloat = 3
		static let SkullRadiusToEyeRadius: CGFloat = 10
		static let SkullRadiusToMouthOffset: CGFloat = 3
		static let SkullRadiusToMouthWidth: CGFloat = 1
		static let SkullRadiusToMouthHeight: CGFloat = 3
	}
	
	private enum Eye {
		case Left
		case Right
	}
	
	private var skullRadius: CGFloat {
		return min(bounds.size.width, bounds.size.height) / 2 * scale
	}
	
	private var skullCenter: CGPoint {
		return CGPoint(x: bounds.midX, y: bounds.midY)
	}
	
	private func pathForCircleCenteredAtPoint(_ center: CGPoint, widthRadius radius: CGFloat) -> UIBezierPath {
		
		// create the circle path points
		let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(2 * Double.pi), clockwise: false)
		
		// set the line width
		path.lineWidth = lineWidth
		
		return path
	}
	
	private func centerForEye(_ eye: Eye) -> CGPoint {
		let eyeOffset = skullRadius / Ratios.SkullRadiusToEyeOffset
		var eyeCenter = skullCenter
		eyeCenter.y -= eyeOffset
		switch eye {
		case .Left: eyeCenter.x -= eyeOffset
		case .Right: eyeCenter.x += eyeOffset
		}
		return eyeCenter
	}
	
	private func pathForEye(_ eye: Eye) -> UIBezierPath {
		let eyeRadius = skullRadius / Ratios.SkullRadiusToEyeRadius
		let eyeCenter = centerForEye(eye)
		return pathForCircleCenteredAtPoint(eyeCenter, widthRadius: eyeRadius)
	}
	
	private func pathForMouth() -> UIBezierPath {
		let mouthWidth = skullRadius / Ratios.SkullRadiusToMouthWidth
		let mouthHeight = skullRadius / Ratios.SkullRadiusToMouthHeight
		let mouthOffset = skullRadius / Ratios.SkullRadiusToMouthOffset
		
		let mouthRect = CGRect(
			x: skullCenter.x - mouthWidth / 2,
			y: skullCenter.y + mouthOffset,
			width: mouthWidth,
			height: mouthHeight
		)
		
		let smileOffset = CGFloat(max(-1, min(mouthCurvature, 1))) * mouthRect.height
		
		let start = CGPoint(x: mouthRect.minX, y: mouthRect.minY)
		let end = CGPoint(x: mouthRect.maxX, y: mouthRect.minY)
		let cp1 = CGPoint(x: mouthRect.minX + mouthWidth / 3, y: mouthRect.minY + smileOffset)
		let cp2 = CGPoint(x: mouthRect.maxX - mouthWidth / 3, y: mouthRect.minY + smileOffset)
		
		let path = UIBezierPath()
		path.move(to: start)
		path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
		path.lineWidth = lineWidth
		
		return path
	}
	
	// override draw() as we perform custom drawing
	override func draw(_ rect: CGRect) {
		
		// set the stroke and fill colour
		UIColor.blue.set()
		
		// draw the bezier paths with predefined properties
		pathForCircleCenteredAtPoint(skullCenter, widthRadius: skullRadius).stroke()
		pathForEye(.Left).stroke()
		pathForEye(.Right).stroke()
		pathForMouth().stroke()
	}
	
}
