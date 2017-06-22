//
//  Album.swift
//  MusicAlbum
//
//  Created by Sourabh on 22/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class Album {
	
	public var title: String!
	public var artist: String!
	public var genre: String!
	public var coverUrl: String!
	public var year: String!
	
	init(title: String, artist: String, genre: String, coverUrl: String, year: String) {
		
		self.title = title
		self.artist = artist
		self.genre = genre
		self.coverUrl = coverUrl
		self.year = year
		
	}
}
