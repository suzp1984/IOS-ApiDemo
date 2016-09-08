//
//  StarsView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/8/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class StarsView: UIView {

    override func drawRect(rect: CGRect) {

        let con = UIGraphicsGetCurrentContext()
        
        // draw gradient background
        let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(),
                                                  [UIColor.blackColor().CGColor, UIColor.whiteColor().CGColor],
                                                  [0.0, 1.0])
        CGContextDrawLinearGradient(con, gradient, CGPoint.zero, CGPointMake(0, rect.height),
                                    CGGradientDrawingOptions.DrawsBeforeStartLocation)
        
        // draw 100 stars
        for _ in 0..<100 {
            let x = CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * rect.width
            let y = CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * rect.height * 0.7
            let r = CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * 5 + 5
            let a = CGFloat(Float(arc4random()) / Float(UINT32_MAX) * Float(M_PI))
            drawStar(con!, x: x, y: y, r: r, a: a)
        }
    }
    
    private func drawStar(context: CGContext, x: CGFloat, y: CGFloat, r: CGFloat, a: CGFloat) {
        CGContextSaveGState(context)
        
        CGContextTranslateCTM(context, x, y)
        CGContextScaleCTM(context, r, r)
        CGContextRotateCTM(context, a)
        
        drawNormalStar(context)
        CGContextRestoreGState(context)
    }
    
    private func drawNormalStar(context: CGContext) {
        
        CGContextMoveToPoint(context, CGFloat(cos(Double(18)/Double(180) * M_PI)),
                             CGFloat(-sin(Double(18)/Double(180)*M_PI)))
        
        for i in 0...4 {
            let x1 = cos(Double(18 + i * 72)/Double(180) * M_PI)
            let y1 = -sin(Double(18 + i * 72)/Double(180) * M_PI)
            
            let x2 = cos(Double(54 + i * 72)/Double(180) * M_PI) * 0.5
            let y2 = -sin(Double(54 + i * 72)/Double(180) * M_PI) * 0.5
            
            // print("x1: ", x1, ", y1: ", y1)
            // print("x2: ", x2, ", y2: ", y2)
            
            CGContextAddLineToPoint(context, CGFloat(x1), CGFloat(y1))
            CGContextAddLineToPoint(context, CGFloat(x2), CGFloat(y2))
        }
        
        CGContextClosePath(context)
     
        CGContextSetRGBFillColor(context, 255, 0, 0, 255)
        CGContextFillPath(context)
    }
}
