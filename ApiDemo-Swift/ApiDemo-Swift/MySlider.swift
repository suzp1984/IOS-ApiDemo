//
//  MySlider.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MySlider: UISlider {

    required init?(coder: NSCoder) {
        super.init(coder:coder)
        
        let t = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(t)
        
        //    self.superview.tintColor = UIColor.redColor()
        //    self.minimumTrackTintColor = UIColor.yellowColor()
        //    self.maximumTrackTintColor = UIColor.greenColor()
        //    self.thumbTintColor = UIColor.orangeColor()
        
        self.setThumbImage(UIImage(named:"moneybag1.png")!, for: UIControlState())
        let coinEnd = UIImage(named:"coin2.png")!.resizableImage(
            withCapInsets: UIEdgeInsetsMake(0,7,0,7), resizingMode: .stretch)
        self.setMinimumTrackImage(coinEnd, for: UIControlState())
        self.setMaximumTrackImage(coinEnd, for: UIControlState())
        
        // self.bounds.size.height += 30
    }
    
    override var intrinsicContentSize : CGSize {
        var sz = super.intrinsicContentSize
        sz.height += 30
        return sz
    }
    
    func tapped(_ g:UIGestureRecognizer) {
        let s = g.view as! UISlider
        if s.isHighlighted {
            return // tap on thumb, let slider deal with it
        }
        let pt = g.location(in: s)
        let track = s.trackRect(forBounds: s.bounds)
        if !track.insetBy(dx: 0, dy: -10).contains(pt) {
            return // not on track, forget it
        }
        let percentage = pt.x / s.bounds.size.width
        let delta = Float(percentage) * (s.maximumValue - s.minimumValue)
        let value = s.minimumValue + delta
        delay(0.1) {
            s.setValue(value, animated:true)
        }
        // animation broken in iOS 7
        // still broken in iOS 8
        // still broken in iOS 9
    }
    
    override func maximumValueImageRect(forBounds bounds: CGRect) -> CGRect {
        return super.maximumValueImageRect(forBounds: bounds).offsetBy(dx: 31, dy: 0)
    }
    
    override func minimumValueImageRect(forBounds bounds: CGRect) -> CGRect {
        return super.minimumValueImageRect(forBounds: bounds).offsetBy(dx: -31, dy: 0)
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var result = super.trackRect(forBounds: bounds)
        result.origin.x = 0
        result.size.width = bounds.size.width
        return result
    }
    
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        return super.thumbRect(
            forBounds: bounds, trackRect: rect, value: value)
            .offsetBy(dx: 0, dy: -7)
    }

}
