//
//  ManuelKastenSecondView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/22/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ManuelKastenSecondView: UIView {

    
    override func draw(_ rect: CGRect) {
        if let img = generateKastenSecondCGImgFrom(width: Int(rect.width), height: Int(rect.height)) {
            if let context = UIGraphicsGetCurrentContext() {
                context.draw(img, in: rect)
            }
        }
    }

    fileprivate func generateKastenSecondCGImgFrom(width: Int, height: Int) -> CGImage? {
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
            
            var red : Float32 = 0
            var green : Float32 = 0
            var blue : Float32 = 0
            
            func kasten_r() -> UInt8 {
                red += Float32(arc4random())/Float32(UINT32_MAX)
                var l = UInt(red)
                l = l % 512
                // l = l % UInt(width/2)
                
                return UInt8(l > 255 ? 511 - l : l)
            }
            
            func kasten_g() -> UInt8 {
                green += Float32(arc4random())/Float32(UINT32_MAX)
                var l = UInt(green)
                l = l % 512
                
                return UInt8(l > 255 ? 511 - l : l)
            }
            
            func kasten_b() -> UInt8 {
                blue += Float32(arc4random())/Float32(UINT32_MAX)
                var l = UInt(blue)
                l = l % 512
                
                return UInt8(l > 255 ? 511 - l : l)
                // return UInt8(l > 255 ? (UInt(width/2) - l) % 255 : l)
            }
            
            for _ in 0 ..< height {
                for _ in 0 ..< width {
                    
                    let r = kasten_r()
                    let g = kasten_g()
                    let b = kasten_b()
                    
                    currentPixel.pointee = RGB32(red: r, green: g, blue: b, alpha: UInt8(255))
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
