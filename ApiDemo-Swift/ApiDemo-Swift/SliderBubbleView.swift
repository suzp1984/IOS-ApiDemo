//
//  SliderBubbleView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class SliderBubbleView: UISlider {

    var bubbleView : UIView!
    var label : UILabel?
    let formatter : NumberFormatter = {
        let n = NumberFormatter()
        n.maximumFractionDigits = 1
        return n
    }()

    override func didMoveToSuperview() {
        self.bubbleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 0)
        let con = UIGraphicsGetCurrentContext()
        let p = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 80), cornerRadius: 10)
        p.move(to: CGPoint(x: 45,y: 80))
        p.addLine(to: CGPoint(x: 50,y: 100))
        p.addLine(to: CGPoint(x: 55,y: 80))
        con?.addPath(p.cgPath)
        UIColor.blue.setFill()
        con?.fillPath()
        let im = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let iv = UIImageView(image: im)
        self.bubbleView.addSubview(iv)
        
        let lab = UILabel(frame:CGRect(x: 0,y: 0,width: 100,height: 80))
        lab.numberOfLines = 1
        lab.textAlignment = .center
        lab.font = UIFont(name:"GillSans-Bold", size:20)
        lab.textColor = UIColor.white
        self.bubbleView.addSubview(lab)
        self.label = lab
    }
    
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        let r = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
        self.bubbleView?.frame.origin.x =
            r.origin.x + (r.size.width/2.0) - (self.bubbleView.frame.size.width/2.0)
        self.bubbleView?.frame.origin.y =
            r.origin.y - 105
        return r
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let bool = super.beginTracking(touch, with: event)
        if bool {
            self.addSubview(self.bubbleView)
            self.label?.text = self.formatter.string(from: NSNumber(self.value))
        }
        return bool
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let bool = super.continueTracking(touch, with: event)
        if bool {
            self.label?.text = self.formatter.string(from: NSNumber(self.value))
        }
        return bool
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        self.bubbleView?.removeFromSuperview()
        super.endTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        self.bubbleView?.removeFromSuperview()
        super.cancelTracking(with: event)
    }


}
