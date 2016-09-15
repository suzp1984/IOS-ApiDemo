//
//  GCDMandelrotView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/4/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

let qkeyString = "label" as NSString
let QKEY = qkeyString.utf8String
let qvalString = "com.neuburg.mandeldraw" as NSString
var QVAL = qvalString.utf8String

class GCDMandelrotView: UIView {

    let MANDELBROT_STEPS = 200
    
    let draw_queue : DispatchQueue = {
        let q = DispatchQueue(label: String(qvalString))
        
        return q
    }()
    
    var bitmapContext: CGContext!
    var odd = false
    
    // jumping-off point: draw the Mandelbrot set
    func drawThatPuppy () {
        let center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        
        var bti : UIBackgroundTaskIdentifier = 0
        bti = UIApplication.shared
            .beginBackgroundTask(expirationHandler: {
                UIApplication.shared.endBackgroundTask(bti)
            })
        if bti == UIBackgroundTaskInvalid {
            return
        }
        self.draw_queue.async {
            if let bitmap = self.makeBitmapContext(self.bounds.size) {
                self.drawAtCenter(center, zoom:1, context:bitmap)
                DispatchQueue.main.async {
                    self.bitmapContext = bitmap
                    self.setNeedsDisplay()
                    UIApplication.shared.endBackgroundTask(bti)
                }
            }
        }

    }
    
    // create bitmap context
    func makeBitmapContext(_ size:CGSize) -> CGContext? {
        var bitmapBytesPerRow = Int(size.width * 4)
        bitmapBytesPerRow += (16 - (bitmapBytesPerRow % 16)) % 16
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let prem = CGImageAlphaInfo.premultipliedLast.rawValue
        let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: bitmapBytesPerRow, space: colorSpace, bitmapInfo: prem)
        return context
    }
    
    // draw pixels of bitmap context
    func drawAtCenter(_ center:CGPoint, zoom:CGFloat, context: CGContext) {
        func isInMandelbrotSet(_ re:Float, _ im:Float) -> Bool {
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
        context.setAllowsAntialiasing(false)
        context.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
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
                    context.fill (CGRect(x: CGFloat(i), y: CGFloat(j), width: 1.0, height: 1.0))
                }
            }
        }
    }
    
    // turn pixels of bitmap context into CGImage, draw into ourselves
    override func draw(_ rect: CGRect) {
        if self.bitmapContext != nil {
            let context = UIGraphicsGetCurrentContext()!
            let im = self.bitmapContext.makeImage()
            context.draw(im!, in: self.bounds)
            self.odd = !self.odd
            self.backgroundColor = self.odd ? UIColor.green : UIColor.red
        }
    }

}
