//
//  PhagocyteView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/23/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class PhagocyteView: UIView {

   
    override func draw(_ rect: CGRect) {
        
        if let img = generatePhagocyImgFrom(width: Int(rect.width), height: Int(rect.height)) {
            if let context = UIGraphicsGetCurrentContext() {
                context.draw(img, in: rect)
            }
        }
    }
    
    fileprivate func generatePhagocyImgFrom(width: Int, height: Int) -> CGImage? {
     
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

                    let s = 3.0/Float(j+99)
                    let y = (Double(j) + sin((Double(i*i) + Double((j-700)*(j-700)*5))/Double(100)/Double(width))*Double(35))*Double(s)
                    
                    let r = UInt8(Int(Double(i + width)*Double(s) + Double(y))%2 + Int(Double(width*2 - i)*Double(s) + Double(y))%2)*UInt8(127)
                    let g = UInt8(Int(Double(5)*(Double(i+width)*Double(s)+Double(y)))%2 + Int(Double(5)*(Double(width*2-i)*Double(s) + Double(y)))%2)*UInt8(127)
                    let b = UInt8(Int(Double(29)*(Double(i+width)*Double(s)+Double(y)))%2 + Int(Double(29)*(Double(width*2-i)*Double(s) + Double(y)))%2)*UInt8(127)
                        
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
