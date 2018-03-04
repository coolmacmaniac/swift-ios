//
//  FacialExpression.swift
//  FaceIt
//
//  Created by Sourabh on 14/05/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

// UI independent representation of facial expression

struct FacialExpression {
	
	enum Eyes: Int {
		case Open
		case Closed
		case Squinting
	}
	
	enum EyeBrows: Int {
		case Relaxed
		case Normal
		case Furrowed
		
		func moreRelaxedBrows() -> EyeBrows {
			return EyeBrows(rawValue: rawValue - 1) ?? .Relaxed
		}
		
		func moreFurrowedBrows() -> EyeBrows {
			return EyeBrows(rawValue: rawValue + 1) ?? .Furrowed
		}
	}
	
	enum Mouth: Int {
		case Smile
		case Grin
		case Normal
		case Smirk
		case Frown
		
		func happierMouth() -> Mouth {
			return Mouth(rawValue: rawValue - 1) ?? .Smile
		}
		
		func sadderMouth() -> Mouth {
			return Mouth(rawValue: rawValue + 1) ?? .Frown
		}
	}
	
	var eyes: Eyes
	var eyeBrows: EyeBrows
	var mouth: Mouth
}
