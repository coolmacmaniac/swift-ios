//
//  ViewController.swift
//  MusicAlbum
//
//  Created by Sourabh on 22/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HorizontalScrollerDelegate {
	
	private var dataTable: UITableView!
	private var allAlbums: Array<Album>!
	private var currentAlbum: Dictionary<String, Array<String>>?
	private var horizontalScroller: HorizontalScroller!
	private var currentAlbumIndex: Int = 0
	
	private static let kTableOffset = CGFloat(120)
	private static let kTableCellId = "albumInfoCell"
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.view.backgroundColor = UIColor(
			red: 0.76,
			green: 0.81,
			blue: 0.87,
			alpha: 0.1
		)
		
		self.allAlbums = LibraryApi.sharedInstance.getAlbums()
		
		var rect = CGRect(
			x: 0,
			y: ViewController.kTableOffset,
			width: self.view.frame.size.width,
			height: self.view.frame.size.height - ViewController.kTableOffset
		)
		self.dataTable = UITableView(frame: rect, style: .grouped)
		self.dataTable.delegate = self
		self.dataTable.dataSource = self
		self.dataTable.backgroundView = nil
		self.view.addSubview(self.dataTable)
		
		//self.dataTable.register(UITableViewCell.self, forCellReuseIdentifier: ViewController.kTableCellId)
		
		rect = CGRect(
			x: 0,
			y: 0,
			width: self.view.frame.size.width,
			height: ViewController.kTableOffset
		)
		self.horizontalScroller = HorizontalScroller(frame: rect)
		self.horizontalScroller.backgroundColor = UIColor(
			red: 0.24,
			green: 0.35,
			blue: 0.49,
			alpha: 1.0
		)
		self.horizontalScroller.delegate = self
		self.view.addSubview(self.horizontalScroller)
		
		self.showDataForAlbum(at: self.currentAlbumIndex)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	private func showDataForAlbum(at index: Int) {
		
		if index < self.allAlbums.count {
			let album = self.allAlbums[index]
			self.currentAlbum = album.tr_tableRepresentation()
		} else {
			self.currentAlbum = nil
		}
		
		self.dataTable.reloadData()
	}
	
	//MARK: - UITableViewDataSource
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return self.currentAlbum?[Album.kKeys]?.count ?? 0
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: ViewController.kTableCellId)
		
		if nil == cell {
			cell = UITableViewCell(style: .value1, reuseIdentifier: ViewController.kTableCellId)
		}
		
		cell.textLabel?.text = self.currentAlbum?[Album.kKeys]?[indexPath.row]
		cell.detailTextLabel?.text = self.currentAlbum?[Album.kValues]?[indexPath.row]
		
		return cell
	
	}
	
	//MARK: - UITableViewDelegate
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		tableView.deselectRow(at: indexPath, animated: true)
		
	}
	
	//MARK: - HorizontalScrollerDelegate
	
	func numberOfViews(in horizontalScroller: HorizontalScroller) -> Int {
		
		return self.allAlbums.count
		
	}
	
	func initialViewIndex(in horizontalScroller: HorizontalScroller) -> Int {
		
		return 0
		
	}
	
	func horizontalScroller(_ horizontalScroller: HorizontalScroller, viewAt index: Int) -> UIView {
		
		let album = self.allAlbums[index]
		let albumView = AlbumView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), albumCover: album.coverUrl)
		return albumView
		
	}
	
	func horizontalScroller(_ horizontalScroller: HorizontalScroller, didSelectViewAt index: Int) {
		
		self.currentAlbumIndex = index
		self.showDataForAlbum(at: index)
		
	}
}
