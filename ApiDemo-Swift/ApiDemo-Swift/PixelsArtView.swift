//
//  PixelsArtView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/11/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class PixelsArtView: UIView {

    
    override func draw(_ rect: CGRect) {
        
        if let img = generatePixels(rect.width, height: rect.height) {
            let con = UIGraphicsGetCurrentContext()
            con?.draw(img, in: rect)
        }
        
    }
 

    fileprivate func generatePixels(_ width: CGFloat, height: CGFloat) -> CGImage? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bitsPerComponent = 8
        let bytesPerRow = Int(CGFloat(bytesPerPixel) * width)
        let bitmapInfo = RGB32.bitmapInfo
        
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo)
        let pixelBuffer = context?.data?.assumingMemoryBound(to: RGB32.self)
        
        var currentPixel = pixelBuffer!
        
        for j in 0..<Int(height) {
            for i in 0..<Int(width) {
            
                let r = UInt8(pow(cos(atan2(Double(j - Int(width)/2), Double(i - Int(width)/2))/2), 2) * 255)
                let g = UInt8(pow(cos(atan2(Double(j - Int(width)/2), Double(i - Int(width)/2))/2 + 2 * acos(-1)/3), 2) * 255)
                let b = UInt8(pow(cos(atan2(Double(j - Int(width)/2), Double(i - Int(width)/2))/2 + 2 * acos(-1)/3), 2) * 255)
                
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
        
    }
}
