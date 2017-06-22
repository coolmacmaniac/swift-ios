//
//  PersistencyManager.swift
//  MusicAlbum
//
//  Created by Sourabh on 22/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class PersistencyManager {
	
	private var albums = Array<Album>()
	
	init() {
		
		self.albums.append(Album(
			title: "Best of Bowie",
			artist: "David Bowie",
			genre: "Country",
			coverUrl: "http://is4.mzstatic.com/image/thumb/Music6/v4/e3/e5/22/e3e522f1-7b50-dc6b-d263-60f35d5e14f7/source/100x100bb.jpg",
			year: "1992")
		)
		
		self.albums.append(Album(
			title: "It's My Life",
			artist: "No Doubt",
			genre: "Rock",
			coverUrl: "http://www.whosampled.com/static/track_images_100/mr7710_2010619_23219541300.jpg",
			year: "2003")
		)
		
		self.albums.append(Album(
			title: "Nothing Like The Sun",
			artist: "Sting",
			genre: "Pop",
			coverUrl: "http://is2.mzstatic.com/image/thumb/Music62/v4/cc/8b/a7/cc8ba718-1fc5-c609-d562-234e312da1c8/source/100x100bb.jpg",
			year: "1999")
		)
		
		self.albums.append(Album(
			title: "Staring at the Sun",
			artist: "U2",
			genre: "Jazz",
			coverUrl: "http://www.whosampled.com/static/track_images_100/mr97239_2014722_174342990792.jpg",
			year: "2000")
		)
		
		self.albums.append(Album(
			title: "American Pie",
			artist: "Madonna",
			genre: "Punk",
			coverUrl: "https://i1.sndcdn.com/artworks-000022582366-xe4dzo-large.jpg",
			year: "2000")
		)

	}
	
	public func getAlbums() -> Array<Album> {
		
		return self.albums
		
	}
	
	public func add(album: Album, atIndex index: Int) {
		
		if index < self.albums.count {
			// can modify the sequence
			self.albums.insert(album, at: index)
		} else {
			// can only append
			self.albums.append(album)
		}
	}
	
	public func deleteAlbum(atIndex index: Int) {
		
		if index < self.albums.count {
			self.albums.remove(at: index)
		}
	}
}
