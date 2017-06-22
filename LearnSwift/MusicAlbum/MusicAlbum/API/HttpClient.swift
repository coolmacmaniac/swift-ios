//
//  HttpClient.swift
//  MusicAlbum
//
//  Created by Sourabh on 22/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class HttpClient {
	
	public func httpGet(url: String) -> Any? {
		
		return nil
		
	}
	
	public func httpPost(url: String, body: String) -> Any? {
		
		return nil
		
	}
	
	public func downloadImage(withUrl url: String) -> UIImage? {
		
		let remoteUrl = URL(string: url)
		
//		guard let data = try? Data(contentsOf: remoteUrl!, options: .mappedIfSafe) else {
//			// error specific information is lost in guard let
//			print("Error downloading the image:\n\(url)")
//			return nil
//		}
//		
//		return UIImage(data: data)
		
		// or
		
		do {
			let data = try Data(contentsOf: remoteUrl!, options: .mappedIfSafe)
			return UIImage(data: data)
		} catch {
			// error specific information is available in do catch
			print("Error downloading the image:\n\(url)\n\(error.localizedDescription)")
		}
		
		return nil
		
	}
	
}
