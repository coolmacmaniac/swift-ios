//: Playground - noun: a place where people can play

import UIKit

func calculateBMI(mass: Float, height: Float) -> Float {
	return mass / powf(height, 2.0)
}

let bmi = calculateBMI(mass: 80, height: 1.75)

if bmi > 30.0 {
	print("You are obese")
} else if bmi > 25.0 {
	print("You are overweight")
} else if bmi >= 18.5 {
	print("You have normal weight")
} else {
	print("You are underweight")
}
