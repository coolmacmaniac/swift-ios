//
//  PersistencyManager.swift
//  MusicAlbum
//
//  Created by Sourabh on 22/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

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
			coverUrl: "http://meloman.spb.ru/media/thumb/7/73/731454099325.jpg",
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
	
	public func save(image: UIImage, withName name: String) {
		let filePath = NSHomeDirectory().appendingFormat("/Documents/%@", name)
		let data = UIImagePNGRepresentation(image)
		do {
			try data?.write(to: URL(fileURLWithPath: filePath), options: .atomic)
		} catch {
			print(error.localizedDescription)
		}
	}
	
	public func getImage(withName name: String) -> UIImage? {
		let filePath = NSHomeDirectory().appendingFormat("/Documents/%@", name)
		do {
			let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
			return UIImage(data: data)
		} catch {
			print(error.localizedDescription)
		}
		return nil
	}
	
	public func deleteImage(withName name: String) {
		let filePath = NSHomeDirectory().appendingFormat("/Documents/%@", name)
		do {
			if FileManager.default.fileExists(atPath: filePath) {
				try FileManager.default.removeItem(at: URL(fileURLWithPath: filePath))
			}
		} catch {
			print(error.localizedDescription)
		}
	}
	
}
