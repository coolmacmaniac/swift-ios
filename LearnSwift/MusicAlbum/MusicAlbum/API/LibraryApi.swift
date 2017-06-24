//
//  LibraryApi.swift
//  MusicAlbum
//
//  Created by Sourabh on 22/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class LibraryApi {
	
	private static var _sharedInstance: LibraryApi?
	
	private let persistencyManager: PersistencyManager
	private let httpClient: HttpClient
	private let isOnline: Bool
	
	public static let sharedInstance: LibraryApi = {
		LibraryApi()
	}()
	
	init() {
		
		persistencyManager = PersistencyManager()
		httpClient = HttpClient()
		isOnline = false
		
		NotificationCenter.default.addObserver(self, selector: #selector(downloadImage(notification:)), name: NSNotification.Name(rawValue: "MADownloadImageNotification"), object: nil)
	}
	
	@objc private func downloadImage(notification: Notification) {
		
		let imageView = (notification.userInfo?["coverImage"] as? UIImageView)!
		let coverUrl = (notification.userInfo?["coverUrl"] as? String)!
		
		//persistencyManager.deleteImage(withName: (URL(string: coverUrl)?.lastPathComponent)!)
		
		imageView.image = persistencyManager.getImage(withName: (URL(string: coverUrl)?.lastPathComponent)!)
		
		if nil == imageView.image {
			DispatchQueue.global(qos: .default).async {
				let image = self.httpClient.downloadImage(withUrl: coverUrl)
				
				if let image = image {
					DispatchQueue.main.sync {
						imageView.image = image
						self.persistencyManager.save(image: image, withName: (URL(string: coverUrl)?.lastPathComponent)!)
					}
				}
			}
		}
	}
	
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
