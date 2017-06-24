//
//  AlbumView.swift
//  MusicAlbum
//
//  Created by Sourabh on 22/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class AlbumView: UIView {
	
	private static let pixelMargin = CGFloat(5)
	
	private var coverImage: UIImageView!
	private var indicator: UIActivityIndicatorView!
	
	init(frame: CGRect, albumCover: String) {
		
		super.init(frame: frame)
		
		self.backgroundColor = .black
		
		// calculate the rect for album image view with side margins
		let rect = CGRect(
			x: AlbumView.pixelMargin,
			y: AlbumView.pixelMargin,
			width: frame.size.width - ( 2 * AlbumView.pixelMargin ),
			height: frame.size.height - ( 2 * AlbumView.pixelMargin )
		)
		
		// create the album image view
		self.coverImage = UIImageView(frame: rect)
		self.addSubview(coverImage)
		
		// create the activity indicator to show image download progress
		self.indicator = UIActivityIndicatorView()
		self.indicator.center = self.center
		self.indicator.activityIndicatorViewStyle = .whiteLarge
		self.indicator.startAnimating()
		self.addSubview(self.indicator)
		
		self.coverImage.addObserver(self, forKeyPath: "image", options: .new, context: nil)
		
		NotificationCenter.default.post(
			name: NSNotification.Name(rawValue: "MADownloadImageNotification"),
			object: self,
			userInfo: ["coverImage": self.coverImage, "coverUrl": albumCover]
		)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	deinit {
		
		self.coverImage.removeObserver(self, forKeyPath: "image")
		
	}
	
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		
		if let _keyPath = keyPath {
			if _keyPath.isEqual("image") {
				self.indicator.stopAnimating()
			}
		}
		
	}
	
}
