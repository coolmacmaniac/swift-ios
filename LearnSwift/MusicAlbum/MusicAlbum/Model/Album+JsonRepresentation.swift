//
//  Album+JsonRepresentation.swift
//  MusicAlbum
//
//  Created by Sourabh on 22/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

// to segregate various extensions of the same class
private typealias JsonRepresentation = Album

extension JsonRepresentation: CustomStringConvertible, CustomDebugStringConvertible {
	
	private func jr_jsonRepresentation() -> String {
		
		let dictionary = [
			Album.kArtist.lowercased(): self.artist,
			Album.kCoverUrl.lowercased(): self.coverUrl,
			Album.kGenre.lowercased(): self.genre,
			Album.kTitle.lowercased(): self.title,
			Album.kYear.lowercased(): self.year
		]
		
		do {
			let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
			let jsonStr = String(data: jsonData, encoding: .utf8)
			return jsonStr ?? "{}"
		} catch {
			print("JSON conversion error: \(error.localizedDescription)")
		}
		
		return "{}"
	}
	
	var description: String {
		// taken from CustomStringConvertible
		get {
			return self.jr_jsonRepresentation()
		}
	}
	
	var debugDescription: String {
		// taken from CustomDebugStringConvertible
		get {
			return self.jr_jsonRepresentation()
		}
	}
	
}
