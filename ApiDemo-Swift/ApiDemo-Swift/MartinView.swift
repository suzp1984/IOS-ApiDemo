//
//  MartinView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/12/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MartinView: UIView {

    var r : [[UInt8]] = []
    var g : [[UInt8]] = []
    var b : [[UInt8]] = []
    
    override func drawRect(rect: CGRect) {
        if let img = generateMartinArt(Int(rect.width), height: Int(rect.height)) {
            let con = UIGraphicsGetCurrentContext()
            CGContextDrawImage(con, rect, img)
        }
    }
 
    private func generateMartinArt(width: Int, height: Int) -> CGImage? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bitsPerComponent = 8
        let bytesPerRow = bytesPerPixel * width
        let bitmapInfo = RGB32.bitmapInfo
        
        let context = CGBitmapContextCreate(nil, Int(width), Int(height), bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo)
        let pixelBuffer = UnsafeMutablePointer<RGB32>(CGBitmapContextGetData(context))
        
        var currentPixel = pixelBuffer
        
        var r = [[Int]](count: height, repeatedValue: [Int](count: width, repeatedValue: 0))
        var g = [[Int]](count: height, repeatedValue: [Int](count: width, repeatedValue: 0))
        var b = [[Int]](count: height, repeatedValue: [Int](count: width, repeatedValue: 0))
        
        for j in 0 ..< height {
            for i in 0 ..< width {
                let r = martin_pixel_r(i, h: j)
                let g = martin_pixel_g(i, h: j)
                let b = martin_pixel_b(i, h: j)
                
                currentPixel.memory = RGB32(red: r, green: g, blue: b, alpha: UInt8(255))
                currentPixel += 1

            }
        }
        
        return nil
    }
    
    private func martin_pixel_r(w: Int, h: Int) -> UInt8 {
        if r[w][h] == 0 {
            r[w][h] = floor(Float(arc4random()) / Float(UINT32_MAX) * 999) == 0 ? UInt8(floor(Float(arc4random()) / Float(UINT32_MAX) * 256)) : martin_pixel_r(w + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2)) % Int(self.bounds.width), h: h + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2)) % Int(self.bounds.width))
        }
        
        return r[w][h]
    }

    private func martin_pixel_g(w: Int, h: Int) -> UInt8 {
        if g[w][h] == 0 {
            g[w][h] = floor(Float(arc4random()) / Float(UINT32_MAX) * 999) == 0 ? UInt8(floor(Float(arc4random()) / Float(UINT32_MAX) * 256)) : martin_pixel_g(w + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2)) % Int(self.bounds.width), h: h + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2)) % Int(self.bounds.width))
        }
        
        return g[w][h]
    }
    
    private func martin_pixel_b(w: Int, h: Int) -> UInt8 {
        if b[w][h] == 0 {
            b[w][h] = floor(Float(arc4random()) / Float(UINT32_MAX) * 999) == 0 ? UInt8(floor(Float(arc4random()) / Float(UINT32_MAX) * 256)) : martin_pixel_b(w + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2)) % Int(self.bounds.width), h: h + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2)) % Int(self.bounds.width))
        }
        
        return b[w][h]
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
        
        static let bitmapInfo = CGImageAlphaInfo.PremultipliedLast.rawValue | CGBitmapInfo.ByteOrder32Little.rawValue
        
        //        static func ==(lhs: RGB32, rhs: RGB32) -> Bool {
        //            return rhs.color == rhs.color
        //        }
    }

}
