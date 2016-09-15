//
//  MandelbrotDrawView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/11/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MandelbrotDrawView: UIView {


    override func draw(_ rect: CGRect) {
        if let img = generateMandelBrotImg(rect.width, height: rect.height) {
            let con = UIGraphicsGetCurrentContext()
            con?.draw(img, in: rect)
        }
    }

    fileprivate func generateMandelBrotImg(_ width: CGFloat, height: CGFloat) -> CGImage? {
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bitsPerComponent = 8
        let bytesPerRow = Int(CGFloat(bytesPerPixel) * width)
        let bitmapInfo = RGB32.bitmapInfo
        
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo)
        let pixelBuffer = UnsafeMutablePointer<RGB32>(context?.data)
        
        var currentPixel = pixelBuffer
        
        for j in 0..<Int(height) {
            for i in 0..<Int(width) {
                var x : CGFloat = 0
                var y : CGFloat = 0
                var tmp = 255
                for k in 1..<256 {
                    let a = CGFloat(x*x) - CGFloat(y*y) + (CGFloat(i) - width * 0.75)/160
                    y = 2*x*y + (CGFloat(j) - width*0.5)/160
                    x = a
                    
                    if (x*x + y*y) > 4 {
                        tmp = k
                        break
                    }
                }
                
                let r = UInt8(log(Double(tmp)) * 46)
                let g = UInt8(log(Double(tmp)) * 46)
                let b = 128 - UInt8(log(Double(tmp)) * 23)
                
                currentPixel.pointee = RGB32(red: r, green: g, blue: b, alpha: UInt8(255))
                currentPixel += 1
            }
        }
        
        let outImgCG = context?.makeImage()
        
        return outImgCG
    }
    
    struct RGB32 {
        var color : UInt32
        
        var red: UInt8 {
            return UInt8((color >> 24) & 255)
        }
        
        var green: UInt8 {
            return UInt8((color >> 16) & 255)
        }
        
        var blue: UInt8 {
            return UInt8((color >> 8) & 255)
        }
        
        var alpha : UInt8 {
            return UInt8((color >> 0) & 255)
        }
        
        init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
            color = (UInt32(red) << 24) | (UInt32(green) << 16) | (UInt32(blue) << 8) | (UInt32(alpha) << 0)
        }
        
        static let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Little.rawValue
        
        //        static func ==(lhs: RGB32, rhs: RGB32) -> Bool {
        //            return rhs.color == rhs.color
        //        }
    }

}
