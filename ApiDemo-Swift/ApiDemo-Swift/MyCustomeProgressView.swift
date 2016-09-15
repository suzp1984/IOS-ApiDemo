//
//  MyCustomeProgressView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/30/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MyCustomeProgressView: UIView {

    var value : CGFloat = 0 {
        didSet {
           
            if value > 1.0 {
                value = 1.0
            } else if value < 0.0 {
                value = 0.0
            }
            print("value is \(value)")
            
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        if let c = UIGraphicsGetCurrentContext() {
            
            UIColor.white.set()
            
            let ins : CGFloat = 2.0
            let r = self.bounds.insetBy(dx: ins, dy: ins)
            let radius : CGFloat = r.size.height / 2.0
            let mpi = CGFloat(M_PI)
            let path = CGMutablePath()
            // path.move(to: CGPoint(x: r.maxX - radius, y: ins))
            CGPathMoveToPoint(path, nil, r.maxX - radius, ins)
            
            CGPathAddArc(path, nil,
                         radius+ins, radius+ins, radius, -mpi/2.0, mpi/2.0, true)
            CGPathAddArc(path, nil,
                         r.maxX - radius, radius+ins, radius, mpi/2.0, -mpi/2.0, true)
            path.closeSubpath()
            c.addPath(path)
            c.setLineWidth(2)
            c.strokePath()
            c.addPath(path)
            c.clip()
            c.fill(CGRect(
                x: r.origin.x, y: r.origin.y, width: r.size.width * self.value, height: r.size.height))
        }
        
    }

}
