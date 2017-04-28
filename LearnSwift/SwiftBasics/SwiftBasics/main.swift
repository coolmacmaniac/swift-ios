//
//  main.swift
//  SwiftBasics
//
//  Created by Sourabh on 28/04/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

//MARK: Hello
print("Hello, World!")
print("Hello, World!", terminator:"")
print()

//MARK: Read Input
//print(">> ", terminator:"")
//let input = readLine()
//if let _input = input {
//	print(_input)
//}

//MARK: Unicode chars as variable names
let π = 22.0/7;
print("π = \(π)")

//MARK: Keywords as variable names
let weak = "weak"; let override = "override"
let `class` = "class"
print("\(weak), \(override), \(`class`)")

//MARK: Bin, Oct & Hex
let binVal = 0b11011
let octVal = 0o123
let hexVal = 0x123
let decVal = 123
print("\(binVal), \(octVal), \(hexVal), \(decVal)")

//MARK: Underscore separators in literals
let largeVal = 777_000_00_0
let largePrecision = 2_9.987_6543_21
print("\(largeVal) \(largePrecision)")

let concat1 = "octVal = " + String(octVal)
//let concat2 = "hexVal = " + (hexVal as String)
print(concat1)

#if RELEASE_MODE
print("Relase Mode")
let buildVersion = 3
#elseif DEBUG_MODE
print("Debug Mode")
let buildVersion = 5
#else
print("Default Mode")
let buildVersion = 7
#endif
print(buildVersion)


