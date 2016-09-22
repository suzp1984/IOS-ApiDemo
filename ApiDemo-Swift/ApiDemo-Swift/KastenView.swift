//
//  KastenView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/22/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class KastenView: UIView {

    
    override func draw(_ rect: CGRect) {
        if let img = generateKastenCGImgFrom(width: Int(rect.width), height: Int(rect.height)) {
            if let con = UIGraphicsGetCurrentContext() {
                con.draw(img, in: rect)
            }
        }
    }

    fileprivate func generateKastenCGImgFrom(width: Int, height: Int) -> CGImage? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bitsPerComponent = 8
        let bytesPerRow = bytesPerPixel * width
        let bitmapInfo = RGB32.bitmapInfo
        
        if let context = CGContext(data: nil, width: Int(width), height: Int(height),
                                bitsPerComponent: bitsPerComponent,
                                bytesPerRow: bytesPerRow,
                                space: colorSpace,
                                bitmapInfo: bitmapInfo) {
            let pixelBuffer = context.data?.assumingMemoryBound(to: RGB32.self)
        
            var currentPixel = pixelBuffer!

            for j in 0 ..< height {
                for i in 0 ..< width {
                    
                    var a : Double = 0
                    var b : Double = 0
                    var c : Double = 0
                    var d : Double = 0
                    var n : Double = 0
                    // n += 1
                    while (c + d) < 4 && n < 880 {
                        // b = 2*a*b + Double(i)*8e-9 - 0.645411
                        // a = c - d + Double(j)*8e-9 + 0.356888
                        
                        b = 2*a*b + Double(i)*16e-9 - 0.645411
                        a = c - d + Double(j)*16e-9 + 0.356888
                        
                        c = a*a
                        d = b*b
                        n += 1
                    }
                    
                    let red = UInt8(pow((n-80)/800, 3.0)*255)
                    let green = UInt8(pow((n-80)/800, 0.7)*255)
                    let blue = UInt8(pow((n-80)/800, 0.5)*255)
                    
                    currentPixel.pointee = RGB32(red: red, green: green, blue: blue, alpha: UInt8(255))
                    currentPixel += 1
                }
            }
        
            let outImg = context.makeImage()
            return outImg
        }
        
        return nil
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
