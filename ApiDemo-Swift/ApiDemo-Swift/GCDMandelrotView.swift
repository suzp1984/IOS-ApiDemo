//
//  GCDMandelrotView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/4/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

let qkeyString = "label" as NSString
let QKEY = qkeyString.UTF8String
let qvalString = "com.neuburg.mandeldraw" as NSString
var QVAL = qvalString.UTF8String

class GCDMandelrotView: UIView {

    let MANDELBROT_STEPS = 200
    
    let draw_queue : dispatch_queue_t = {
        let q = dispatch_queue_create(QVAL, nil)
        dispatch_queue_set_specific(q, QKEY, &QVAL, nil)
        return q
    }()
    
    var bitmapContext: CGContext!
    var odd = false
    
    // jumping-off point: draw the Mandelbrot set
    func drawThatPuppy () {
        let center = CGPointMake(self.bounds.midX, self.bounds.midY)
        
        var bti : UIBackgroundTaskIdentifier = 0
        bti = UIApplication.sharedApplication()
            .beginBackgroundTaskWithExpirationHandler({
                UIApplication.sharedApplication().endBackgroundTask(bti)
            })
        if bti == UIBackgroundTaskInvalid {
            return
        }
        dispatch_async(self.draw_queue) {
            if let bitmap = self.makeBitmapContext(self.bounds.size) {
                self.drawAtCenter(center, zoom:1, context:bitmap)
                dispatch_async(dispatch_get_main_queue()) {
                    self.bitmapContext = bitmap
                    self.setNeedsDisplay()
                    UIApplication.sharedApplication().endBackgroundTask(bti)
                }
            }
        }

    }
    
    // create bitmap context
    func makeBitmapContext(size:CGSize) -> CGContext? {
        var bitmapBytesPerRow = Int(size.width * 4)
        bitmapBytesPerRow += (16 - (bitmapBytesPerRow % 16)) % 16
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let prem = CGImageAlphaInfo.PremultipliedLast.rawValue
        let context = CGBitmapContextCreate(nil, Int(size.width), Int(size.height), 8, bitmapBytesPerRow, colorSpace, prem)
        return context
    }
    
    // draw pixels of bitmap context
    func drawAtCenter(center:CGPoint, zoom:CGFloat, context: CGContext) {
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
        CGContextSetAllowsAntialiasing(context, false)
        CGContextSetRGBFillColor(context, 0, 0, 0, 1)
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
                    CGContextFillRect (context, CGRectMake(CGFloat(i), CGFloat(j), 1.0, 1.0))
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
