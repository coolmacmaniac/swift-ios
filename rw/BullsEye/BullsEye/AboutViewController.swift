//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Sourabh on 13/03/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

	@IBOutlet weak var webView: WKWebView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		if let fileUrl = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
			if let htmlData = try? Data(contentsOf: fileUrl) {
				let baseUrl = Bundle.main.bundleURL
				webView.load(htmlData, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: baseUrl)
			}
		}
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func closeView() {
		dismiss(animated: true, completion: nil)
	}
}
