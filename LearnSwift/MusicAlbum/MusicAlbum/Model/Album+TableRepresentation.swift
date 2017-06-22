//
//  Album+TableRepresentation.swift
//  MusicAlbum
//
//  Created by Sourabh on 22/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

// to segregate various extensions of the same class
private typealias TableRepresentation = Album

extension TableRepresentation {
	
	public func tr_tableRepresentation() -> Dictionary<String, Array<String>> {
		
		// returns a dictionary of key and value arrays
		return [
			Album.kKeys: [
				Album.kArtist,
				Album.kGenre,
				Album.kTitle,
				Album.kYear
			],
			Album.kValues: [
				self.artist,
				self.genre,
				self.title,
				self.year
			]
		]
		
	}
}
