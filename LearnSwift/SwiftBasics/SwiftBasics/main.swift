//
//  main.swift
//  SwiftBasics
//
//  Created by Sourabh on 28/04/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

//MARK: Hello World
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

//Mark: String concatenation
let concat1 = "octVal = " + String(octVal)
//let concat2 = "hexVal = " + (hexVal as String)
print(concat1)

//Mark: Swift preprocessor flags
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

//MARK: Unwrapping optionals
var optStr1: String? = "optStr1"
var optStr2: Optional<String> = "optStr2"
if nil != optStr1 {
	if optStr1!.hasPrefix("opt") {
		let str = "has matchin' prefix"
		print(str)
	}
}
if nil != optStr2 {
	var empty = optStr2!.isEmpty
	print(empty)
	optStr2 = ""
	empty = optStr2!.isEmpty	// blank string is also empty
	print(empty)
}
let unwrappedString1: String! = nil//"Value is expected"
let unwrappedString2: ImplicitlyUnwrappedOptional<String> = "Another value is expected"
let normalString1: String = "No matter"
let normalString2: String = "what happens"
print("<\(optStr1!)>, <\(optStr2!)>")					// unwrapping is required explicitly
print("<\(unwrappedString1)>, <\(unwrappedString2)>")	// unwrapping is done implicitly
print("<\(normalString1)>, <\(normalString2)>")			// unwrapping is not required

var str1: String? = "a"
var str2: String! = "b"
var str3 = str1
var str4 = str2
print("\(str1!) \(str2)")
print("\(str3!) \(str4!)")

//MARK: Optional (safe) behaviour propagated
var p1 = Person("John", "Cena")			// p1 is of type Optional<Person> for inferred type
print("\((p1?.firstName)!) \((p1?.lastName)!)")
//p1 = nil
let p2 = p1								// p2 is also of type Optional<Person> by default
let fn: String = (p2?.firstName)!		// Optional nature is propagated to parameters
let ln: String = (p2?.lastName)!		// Optional nature is propagated to parameters
print("\(fn) \(ln)")

//MARK: ImplicitlyUnwrappedOptional (unsafe) behaviour not propagated
let p3: Person! = Person("Jack", "Sparrow")		// p3 is declared of type ImplicitlyUnwrappedOptional<Person>
print("\(p3.firstName) \(p3.lastName)")			// can access its members directly
let p4 = p3		// p4 is of type Optional<Person>, ImplicitlyUnwrappedOptional<Person> is not propagated automatically
print("\((p4?.firstName)!) \((p4?.lastName)!)")	// have to be unwrapped before its members are accessed

