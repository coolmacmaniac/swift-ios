//: Playground - noun: a place where people can play

import UIKit

func fibonacci(until: UInt = 0) {
	if until == 0 {
		print("Please enter a non-zero limit")
		return
	}
	var beforePrevious = 0
	var previous = 1
	var term = 0
	for count in 1...until {
		if count <= 2 {
			print(count - 1)
			continue
		}
		term = beforePrevious + previous
		print(term)
		beforePrevious = previous
		previous = term
	}
}

fibonacci(until: 3)


//: sum of multiples of either 3 or 5
func sumOfMultiples(of a: UInt, below until: UInt) -> UInt {
	if a >= until {
		return 0
	}
	let n = ( until - 1 ) / a
	let sum = n * ( 2 * a + (n - 1) * a ) / 2
	return sum
}
let d1: UInt = 3
let d2: UInt = 5
let d3: UInt = 3 * 5		// L.C.M.
let max: UInt = 1000
let sum1 = sumOfMultiples(of: d1, below: max)
print("Sum of multiples of \(d1) till \(max): \(sum1)")
let sum2 = sumOfMultiples(of: d2, below: max)
print("Sum of multiples of \(d2) till \(max): \(sum2)")
let sum3 = sumOfMultiples(of: d3, below: max)
print("Sum of multiples of \(d3) till \(max): \(sum3)")
let diff = sum1 + sum2 - sum3
print("Sum of multiples of either \(d1) or \(d2) till \(max): \(diff)")
