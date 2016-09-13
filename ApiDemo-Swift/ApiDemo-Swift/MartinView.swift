//
//  MartinView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 9/12/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MartinView: UIView {

    var width: Int = 0
    var height: Int = 0;
    
    override func drawRect(rect: CGRect) {
        if let img = generateMartinArt(Int(rect.width), height: Int(rect.height)) {
            let con = UIGraphicsGetCurrentContext()
            CGContextDrawImage(con, rect, img)
        }
    }
 
    private func generateMartinArt(width: Int, height: Int) -> CGImage? {
        print("\(width) \(height)")
        self.width = width
        self.height = height
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bitsPerComponent = 8
        let bytesPerRow = bytesPerPixel * width
        let bitmapInfo = RGB32.bitmapInfo
        
        let context = CGBitmapContextCreate(nil, Int(width), Int(height), bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo)
        let pixelBuffer = UnsafeMutablePointer<RGB32>(CGBitmapContextGetData(context))
        
        var currentPixel = pixelBuffer
        
        var r = [[UInt8]](count: height, repeatedValue: [UInt8](count: width, repeatedValue: 0))
        var g = [[UInt8]](count: height, repeatedValue: [UInt8](count: width, repeatedValue: 0))
        var b = [[UInt8]](count: height, repeatedValue: [UInt8](count: width, repeatedValue: 0))
        
        for j in 0 ..< height {
            for i in 0 ..< width {
                let red = martin_pixel_r(&r, w: i, h: j)
                let green = martin_pixel_g(&g, w: i, h: j)
                let blue = martin_pixel_b(&b, w: i, h: j)
                
                currentPixel.memory = RGB32(red: red, green: green, blue: blue, alpha: UInt8(255))
                currentPixel += 1

            }
        }
        
        let outImgCG = CGBitmapContextCreateImage(context)
        
        return outImgCG
    }
    
    private func martin_pixel_r(inout r: [[UInt8]], w: Int, h: Int) -> UInt8 {
        
        if r[h][w] == 0 {
            r[h][w] = floor(Float(arc4random()) / Float(UINT32_MAX) * 999) == 0 ? UInt8(floor(Float(arc4random()) / Float(UINT32_MAX) * 256)) : martin_pixel_r(&r, w: (w + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2))) % width, h: (h + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2))) % height)
        }
        
        return r[h][w]
    }

    private func martin_pixel_g(inout g: [[UInt8]], w: Int, h: Int) -> UInt8 {
        
        if g[h][w] == 0 {
            g[h][w] = floor(Float(arc4random()) / Float(UINT32_MAX) * 999) == 0 ? UInt8(floor(Float(arc4random()) / Float(UINT32_MAX) * 256)) : martin_pixel_g(&g, w: (w + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2))) % width, h: (h + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2))) % height)
        }
        
        return g[h][w]
    }
    
    private func martin_pixel_b(inout b: [[UInt8]], w: Int, h: Int) -> UInt8 {
        
        if b[h][w] == 0 {
            b[h][w] = floor(Float(arc4random()) / Float(UINT32_MAX) * 999) == 0 ? UInt8(floor(Float(arc4random()) / Float(UINT32_MAX) * 256)) : martin_pixel_b(&b, w: (w + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2))) % width, h: (h + Int(floor(Float(arc4random()) / Float(UINT32_MAX) * 2))) % height)
        }
        
        return b[h][w]
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
