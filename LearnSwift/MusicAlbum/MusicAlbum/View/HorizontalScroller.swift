//
//  HorizontalScroller.swift
//  MusicAlbum
//
//  Created by Sourabh on 23/06/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class HorizontalScroller: UIView, UIScrollViewDelegate {
	
	public static let VIEW_PADDING		= CGFloat(10)
	public static let VIEW_DIMENSION	= CGFloat(100)
	public static let VIEWS_OFFSET		= CGFloat(100)
	
	public weak var delegate: HorizontalScrollerDelegate?
	
	private var scrollView: UIScrollView
	
	override init(frame: CGRect) {
		
		let rect = CGRect(
			x: 0,
			y: 0,
			width: frame.size.width,
			height: frame.size.height
		)
		
		scrollView = UIScrollView(frame: rect)
		super.init(frame: frame)
		initialize()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		
		scrollView = UIScrollView(coder: aDecoder)!
		super.init(coder: aDecoder)
		initialize()
		
	}
	
	private func initialize() {
		scrollView.delegate = self
		addSubview(scrollView)
		
		let tapGestureRecognizer = UITapGestureRecognizer()
		tapGestureRecognizer.addTarget(self, action: #selector(scrollerTapped(tapGestureRecognizer:)))
		scrollView.addGestureRecognizer(tapGestureRecognizer)
	}
	
	override func didMoveToSuperview() {
		
		// message is sent to a view when it's added to another view as a subview.
		// This is the right time to reload the contents of the scroller.
		self.reload()
		
	}
	
	@objc private func scrollerTapped(tapGestureRecognizer: UITapGestureRecognizer) {
		
		let tapPoint = tapGestureRecognizer.location(in: tapGestureRecognizer.view)
		
		// we can't use an enumerator here, because we don't want to enumerate
		// over all of the UIScrollView subviews.
		// we want to enumerate only the subviews that we added
		let numViews = self.delegate?.numberOfViews(in: self) ?? 0
		for index in 0..<numViews {
			
			let subview = self.scrollView.subviews[index]
			if subview.frame.contains(tapPoint) {
				self.delegate?.horizontalScroller(self, didSelectViewAt: index)
				self.scrollView.setContentOffset(CGPoint(
					x: subview.frame.origin.x - self.bounds.size.width / 2 + subview.frame.size.width / 2,
					y: 0
				), animated: true)
				break
			}
		}
	}
	
	private func centerCurrentView() {
		
		var xFinal = self.scrollView.contentOffset.x + HorizontalScroller.VIEW_PADDING + ( HorizontalScroller.VIEWS_OFFSET / 2 )
		let viewIndex = xFinal / ( HorizontalScroller.VIEW_DIMENSION + 2 * HorizontalScroller.VIEW_PADDING )
		xFinal = viewIndex * ( HorizontalScroller.VIEW_DIMENSION + 2 * HorizontalScroller.VIEW_PADDING )
		self.scrollView.setContentOffset(CGPoint(x: xFinal, y: 0), animated: true)
		self.delegate?.horizontalScroller(self, didSelectViewAt: Int(viewIndex))
		
	}
	
	public func reload() {
		
		// remove all subviews
		for view in self.scrollView.subviews {
			view.removeFromSuperview()
		}
		
		// get the total number of subviews
		let numViews = self.delegate?.numberOfViews(in: self) ?? 0
		
		// xValue is the starting X point of each view inside the scroller
		var xValue = HorizontalScroller.VIEWS_OFFSET
		
		// enumerate and get each view, compute its frame and set it
		for index in 0 ..< numViews {
			xValue += HorizontalScroller.VIEW_PADDING
			let view = (self.delegate?.horizontalScroller(self, viewAt: index))!
			let frame = CGRect(
				x: xValue,
				y: HorizontalScroller.VIEW_PADDING,
				width: HorizontalScroller.VIEW_DIMENSION,
				height: HorizontalScroller.VIEW_DIMENSION
			)
			view.frame = frame
			self.scrollView.addSubview(view)
			xValue += HorizontalScroller.VIEW_DIMENSION + HorizontalScroller.VIEW_PADDING
		}
		
		// update the content size of scroll view so that it can scroll
		self.scrollView.contentSize = CGSize(
			width: xValue + HorizontalScroller.VIEWS_OFFSET,
			height: self.frame.size.height
		)
		
		// if an initial view index is set then center it inside the scroll view
		let initialIndex = CGFloat( self.delegate?.initialViewIndex(in: self) ?? 0 )
		self.scrollView.setContentOffset(CGPoint(
			x: initialIndex * ( 2 * HorizontalScroller.VIEW_PADDING + HorizontalScroller.VIEW_DIMENSION),
			y: 0
		), animated: true)
		
	}
	
	//MARK: - UIScrollViewDelegate
	
	func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
		
		if !decelerate {
			self.centerCurrentView()
		}
	}
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		
		self.centerCurrentView()
		
	}
}

// The class keyword in the Swift protocol definition limits protocol adoption to class types
// (and not structures or enums). This is important if we want to use a weak reference to the delegate.
protocol HorizontalScrollerDelegate: class {
	
	// ask the delegate how many views he wants to present inside the horizontal scroller
	func numberOfViews(in horizontalScroller: HorizontalScroller) -> Int
	
	// ask the delegate to return the view that should appear at <index>
	func horizontalScroller(_ horizontalScroller: HorizontalScroller, viewAt index: Int) -> UIView
	
	// inform the delegate what the view at <index> has been clicked
	func horizontalScroller(_ horizontalScroller: HorizontalScroller, didSelectViewAt index: Int)
	
	// ask the delegate for the index of the initial view to display, defaults to 0
	func initialViewIndex(in horizontalScroller: HorizontalScroller) -> Int
	
}
