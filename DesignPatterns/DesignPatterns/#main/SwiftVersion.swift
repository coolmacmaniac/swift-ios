//
//  SwiftVersion.swift
//  DesignPatterns
//
//  Created by Sourabh on 24/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class SwiftVersion {
	
	class func findSwiftLanguageVersion() -> String {
		
		// $ xcrun swift -version
		
		// create the process task with command path and its arguments
		let nstask = Process()
		nstask.launchPath = "/usr/bin/xcrun"
		nstask.arguments = ["swift", "-version"]
		
		// redirect the output of process task execution to a pipe
		// so that it can be read there from
		let pipe = Pipe()
		nstask.standardOutput = pipe
		nstask.standardError = pipe
		
		// execute the configured process task
		nstask.launch()
		nstask.waitUntilExit()
		
		// fetch the result of process task execution
		let result = pipe.fileHandleForReading.readDataToEndOfFile()
		let output = String(data: result, encoding: .utf8)
		let version = output?.components(separatedBy: " ")[3]
		return version!
	}
	
}
