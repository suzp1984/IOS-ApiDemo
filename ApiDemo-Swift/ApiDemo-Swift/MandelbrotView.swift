//
//  MandelbrotView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/3/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MandelbrotView: UIView {

    let MANDELBROT_STEPS = 200
    
    var bitmapContext: CGContext!
    var odd = false
    
    // jumping-off point: draw the Mandelbrot set
    func drawThatPuppy () {
        self.makeBitmapContext(self.bounds.size)
        let center = CGPointMake(self.bounds.midX, self.bounds.midY)
        self.drawAtCenter(center, zoom:1)
        self.setNeedsDisplay()
    }
    
    // create bitmap context
    func makeBitmapContext(size:CGSize) {
        var bitmapBytesPerRow = Int(size.width * 4)
        bitmapBytesPerRow += (16 - (bitmapBytesPerRow % 16)) % 16
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let prem = CGImageAlphaInfo.PremultipliedLast.rawValue
        let context = CGBitmapContextCreate(nil, Int(size.width), Int(size.height), 8, bitmapBytesPerRow, colorSpace, prem)
        self.bitmapContext = context
    }
    
    // draw pixels of bitmap context
    func drawAtCenter(center:CGPoint, zoom:CGFloat) {
        func isInMandelbrotSet(re:Float, _ im:Float) -> Bool {
            var fl = true
            var (x, y, nx, ny) : (Float,Float,Float,Float) = (0,0,0,0)
            for _ in 0 ..< MANDELBROT_STEPS {
                nx = x*x - y*y + re
                ny = 2*x*y + im
                if nx*nx + ny*ny > 4 {
                    fl = false
                    break
                }
                x = nx
                y = ny
            }
            return fl
        }
        CGContextSetAllowsAntialiasing(self.bitmapContext, false)
        CGContextSetRGBFillColor(self.bitmapContext, 0, 0, 0, 1)
        var re : CGFloat
        var im : CGFloat
        let maxi = Int(self.bounds.size.width)
        let maxj = Int(self.bounds.size.height)
        for i in 0 ..< maxi {
            for j in 0 ..< maxj {
                re = (CGFloat(i) - 1.33 * center.x) / 160
                im = (CGFloat(j) - 1.0 * center.y) / 160
                re /= zoom
                im /= zoom
                if (isInMandelbrotSet(Float(re), Float(im))) {
                    CGContextFillRect (self.bitmapContext, CGRectMake(CGFloat(i), CGFloat(j), 1.0, 1.0))
                }
            }
        }
    }
    
    // turn pixels of bitmap context into CGImage, draw into ourselves
    override func drawRect(rect: CGRect) {
        if self.bitmapContext != nil {
            let context = UIGraphicsGetCurrentContext()!
            let im = CGBitmapContextCreateImage(self.bitmapContext)
            CGContextDrawImage(context, self.bounds, im)
            self.odd = !self.odd
            self.backgroundColor = self.odd ? UIColor.greenColor() : UIColor.redColor()
        }
    }
}