//
//  LibraryApi.swift
//  MusicAlbum
//
//  Created by Sourabh on 22/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import Foundation

class LibraryApi {
	
	private static var _sharedInstance: LibraryApi?
	
	private let persistencyManager = PersistencyManager()
	private let httpClient = HttpClient()
	private let isOnline = false
	
	public static let sharedInstance: LibraryApi = {
		LibraryApi()
	}()
	
	public func getAlbums() -> Array<Album> {
		
		return self.persistencyManager.getAlbums()
		
	}
	
	public func add(album: Album, atIndex index: Int) {
		
		self.persistencyManager.add(album: album, atIndex: index)
		
		if isOnline {
			_ = self.httpClient.httpPost(url: "api/addAlbum", body: album.description)
		}
	}
	
	public func deleteAlbum(atIndex index: Int) {
		
		self.persistencyManager.deleteAlbum(atIndex: index)
		
		if isOnline {
			_ = self.httpClient.httpPost(url: "api/deleteAlbum", body: index.description)
		}
	}
	
}
