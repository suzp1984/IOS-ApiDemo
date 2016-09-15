//
//  StarsView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/8/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class StarsView: UIView {

    override func draw(_ rect: CGRect) {

        let con = UIGraphicsGetCurrentContext()
        
        // draw gradient background
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                                  colors: [UIColor.black.cgColor, UIColor.white.cgColor],
                                                  locations: [0.0, 1.0])
        con.drawLinearGradient(gradient, start: CGPoint.zero, end: CGPoint(x: 0, y: rect.height),
                                    options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        
        // draw 100 stars
        for _ in 0..<100 {
            let x = CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * rect.width
            let y = CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * rect.height * 0.7
            let r = CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * 5 + 5
            let a = CGFloat(Float(arc4random()) / Float(UINT32_MAX) * Float(M_PI))
            drawStar(con!, x: x, y: y, r: r, a: a)
        }
    }
    
    fileprivate func drawStar(_ context: CGContext, x: CGFloat, y: CGFloat, r: CGFloat, a: CGFloat) {
        context.saveGState()
        
        context.translateBy(x: x, y: y)
        context.scaleBy(x: r, y: r)
        context.rotate(by: a)
        
        drawNormalStar(context)
        context.restoreGState()
    }
    
    fileprivate func drawNormalStar(_ context: CGContext) {
        
        context.move(to: CGPoint(x: CGFloat(cos(Double(18)/Double(180) * M_PI)), y: CGFloat(-sin(Double(18)/Double(180)*M_PI))))
        
        for i in 0...4 {
            let x1 = cos(Double(18 + i * 72)/Double(180) * M_PI)
            let y1 = -sin(Double(18 + i * 72)/Double(180) * M_PI)
            
            let x2 = cos(Double(54 + i * 72)/Double(180) * M_PI) * 0.5
            let y2 = -sin(Double(54 + i * 72)/Double(180) * M_PI) * 0.5
            
            // print("x1: ", x1, ", y1: ", y1)
            // print("x2: ", x2, ", y2: ", y2)
            
            context.addLine(to: CGPoint(x: CGFloat(x1), y: CGFloat(y1)))
            context.addLine(to: CGPoint(x: CGFloat(x2), y: CGFloat(y2)))
        }
        
        context.closePath()
     
        context.setFillColor(red: 255, green: 0, blue: 0, alpha: 255)
        context.fillPath()
    }
}
