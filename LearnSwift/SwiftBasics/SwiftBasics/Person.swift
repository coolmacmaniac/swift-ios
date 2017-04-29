//
//  Person.swift
//  SwiftBasics
//
//  Created by Sourabh on 29/04/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

struct Person {
	var firstName: String
	var lastName: String
	
	init!(_ firstName: String, _ lastName: String) {
		guard !firstName.isEmpty && !lastName.isEmpty else {
			return nil
		}
		self.firstName = firstName
		self.lastName = lastName
	}
}

