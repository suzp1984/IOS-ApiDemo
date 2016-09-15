import UIKit

class MyCustomDrawingView: UIView {

    lazy var arrow : UIImage = self.arrowImage()
    
    init() {
        super.init(frame:CGRect.zero)
        self.isOpaque = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.isOpaque = false
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.isOpaque = false
    }
    
    var which = 1
    
    override func draw(_ rect: CGRect) {
        switch which {
        case 1:
            let con = UIGraphicsGetCurrentContext()!
            
            // draw a black (by default) vertical line, the shaft of the arrow
            con.move(to: CGPoint(x: 100, y: 100))
            con.addLine(to: CGPoint(x: 100, y: 19))
            con.setLineWidth(20)
            con.strokePath()
            
            // draw a red triangle, the point of the arrow
            con.setFillColor(UIColor.red.cgColor)
            con.move(to: CGPoint(x: 80, y: 25))
            con.addLine(to: CGPoint(x: 100, y: 0))
            con.addLine(to: CGPoint(x: 120, y: 25))
            con.fillPath()
            
            // snip a triangle out of the shaft by drawing in Clear blend mode
            con.move(to: CGPoint(x: 90, y: 101))
            con.addLine(to: CGPoint(x: 100, y: 90))
            con.addLine(to: CGPoint(x: 110, y: 101))
            con.setBlendMode(.clear)
            con.fillPath()
            
        case 2:
            let p = UIBezierPath()
            p.move(to: CGPoint(x: 100,y: 100))
            p.addLine(to: CGPoint(x: 100, y: 19))
            p.lineWidth = 20
            p.stroke()
            
            UIColor.red.set()
            p.removeAllPoints()
            p.move(to: CGPoint(x: 80,y: 25))
            p.addLine(to: CGPoint(x: 100, y: 0))
            p.addLine(to: CGPoint(x: 120, y: 25))
            p.fill()
            
            p.removeAllPoints()
            p.move(to: CGPoint(x: 90,y: 101))
            p.addLine(to: CGPoint(x: 100, y: 90))
            p.addLine(to: CGPoint(x: 110, y: 101))
            p.fill(with: .clear, alpha:1.0)
            
        case 3:
            
            // obtain the current graphics context
            let con = UIGraphicsGetCurrentContext()!
            
            // punch triangular hole in context clipping region
            con.move(to: CGPoint(x: 90, y: 100))
            con.addLine(to: CGPoint(x: 100, y: 90))
            con.addLine(to: CGPoint(x: 110, y: 100))
            con.closePath()
            con.addRect(con.boundingBoxOfClipPath)
            CGContextEOClip(con)
            
            // draw the vertical line
            con.move(to: CGPoint(x: 100, y: 100))
            con.addLine(to: CGPoint(x: 100, y: 19))
            con.setLineWidth(20)
            con.strokePath()
            
            // draw the red triangle, the point of the arrow
            con.setFillColor(UIColor.red.cgColor)
            con.move(to: CGPoint(x: 80, y: 25))
            con.addLine(to: CGPoint(x: 100, y: 0))
            con.addLine(to: CGPoint(x: 120, y: 25))
            con.fillPath()
            
        case 4:
            // obtain the current graphics context
            let con = UIGraphicsGetCurrentContext()!
            con.saveGState()
            
            // punch triangular hole in context clipping region
            con.move(to: CGPoint(x: 90, y: 100))
            con.addLine(to: CGPoint(x: 100, y: 90))
            con.addLine(to: CGPoint(x: 110, y: 100))
            con.closePath()
            con.addRect(con.boundingBoxOfClipPath)
            CGContextEOClip(con)
            
            // draw the vertical line, add its shape to the clipping region
            con.move(to: CGPoint(x: 100, y: 100))
            con.addLine(to: CGPoint(x: 100, y: 19))
            con.setLineWidth(20)
            con.replacePathWithStrokedPath()
            con.clip()
            
            // draw the gradient
            let locs : [CGFloat] = [ 0.0, 0.5, 1.0 ]
            let colors : [CGFloat] = [
                0.8, 0.4, // starting color, transparent light gray
                0.1, 0.5, // intermediate color, darker less transparent gray
                0.8, 0.4, // ending color, transparent light gray
            ]
            let sp = CGColorSpaceCreateDeviceGray()
            // print(CGColorSpaceGetNumberOfComponents(sp))
            let grad =
                CGGradient (colorSpace: sp, colorComponents: colors, locations: locs, count: 3)
            con.drawLinearGradient (grad!, start: CGPoint(x: 89,y: 0), end: CGPoint(x: 111,y: 0), options: [])
            
            con.restoreGState() // done clipping
            
            // draw the red triangle, the point of the arrow
            con.setFillColor(UIColor.red.cgColor)
            con.move(to: CGPoint(x: 80, y: 25))
            con.addLine(to: CGPoint(x: 100, y: 0))
            con.addLine(to: CGPoint(x: 120, y: 25))
            con.fillPath()
            
        case 5:
            // obtain the current graphics context
            let con = UIGraphicsGetCurrentContext()!
            con.saveGState()
            
            // punch triangular hole in context clipping region
            con.move(to: CGPoint(x: 90, y: 100))
            con.addLine(to: CGPoint(x: 100, y: 90))
            con.addLine(to: CGPoint(x: 110, y: 100))
            con.closePath()
            con.addRect(con.boundingBoxOfClipPath)
            CGContextEOClip(con)
            
            // draw the vertical line, add its shape to the clipping region
            con.move(to: CGPoint(x: 100, y: 100))
            con.addLine(to: CGPoint(x: 100, y: 19))
            con.setLineWidth(20)
            con.replacePathWithStrokedPath()
            con.clip()
            
            // draw the gradient
            let locs : [CGFloat] = [ 0.0, 0.5, 1.0 ]
            let colors : [CGFloat] = [
                0.8, 0.4, // starting color, transparent light gray
                0.1, 0.5, // intermediate color, darker less transparent gray
                0.8, 0.4, // ending color, transparent light gray
            ]
            let sp = CGColorSpaceCreateDeviceGray()
            let grad =
                CGGradient (colorSpace: sp, colorComponents: colors, locations: locs, count: 3)
            con.drawLinearGradient (grad!, start: CGPoint(x: 89,y: 0), end: CGPoint(x: 111,y: 0), options: [])
            
            con.restoreGState() // done clipping
            
            // draw the red triangle, the point of the arrow
            UIGraphicsBeginImageContextWithOptions(CGSize(width: 4,height: 4), false, 0)
            let imcon = UIGraphicsGetCurrentContext()!
            imcon.setFillColor(UIColor.red.cgColor)
            imcon.fill(CGRect(x: 0,y: 0,width: 4,height: 4))
            imcon.setFillColor(UIColor.blue.cgColor)
            imcon.fill(CGRect(x: 0,y: 0,width: 4,height: 2))
            let stripes = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            let stripesPattern = UIColor(patternImage:stripes!)
            stripesPattern.setFill()
            let p = UIBezierPath()
            p.move(to: CGPoint(x: 80,y: 25))
            p.addLine(to: CGPoint(x: 100,y: 0))
            p.addLine(to: CGPoint(x: 120,y: 25))
            p.fill()
            
        case 6:
            
            // obtain the current graphics context
            let con = UIGraphicsGetCurrentContext()!
            con.saveGState()
            
            // punch triangular hole in context clipping region
            con.move(to: CGPoint(x: 90, y: 100))
            con.addLine(to: CGPoint(x: 100, y: 90))
            con.addLine(to: CGPoint(x: 110, y: 100))
            con.closePath()
            con.addRect(con.boundingBoxOfClipPath)
            CGContextEOClip(con)
            
            // draw the vertical line, add its shape to the clipping region
            con.move(to: CGPoint(x: 100, y: 100))
            con.addLine(to: CGPoint(x: 100, y: 19))
            con.setLineWidth(20)
            con.replacePathWithStrokedPath()
            con.clip()
            
            // draw the gradient
            let locs : [CGFloat] = [ 0.0, 0.5, 1.0 ]
            let colors : [CGFloat] = [
                0.8, 0.4, // starting color, transparent light gray
                0.1, 0.5, // intermediate color, darker less transparent gray
                0.8, 0.4, // ending color, transparent light gray
            ]
            let sp = CGColorSpaceCreateDeviceGray()
            let grad =
                CGGradient (colorSpace: sp, colorComponents: colors, locations: locs, count: 3)
            con.drawLinearGradient (grad!, start: CGPoint(x: 89,y: 0), end: CGPoint(x: 111,y: 0), options: [])
            
            con.restoreGState() // done clipping
            
            
            // draw the red triangle, the point of the arrow
            let sp2 = CGColorSpace(patternBaseSpace: nil)
            con.setFillColorSpace(sp2!)
            // hooray for Swift 2.0!
            let drawStripes : CGPatternDrawPatternCallback = {
                _, con in
                con.setFillColor(UIColor.red.cgColor)
                con.fill(CGRect(x: 0,y: 0,width: 4,height: 4))
                con.setFillColor(UIColor.blue.cgColor)
                con.fill(CGRect(x: 0,y: 0,width: 4,height: 2))
            }
            var callbacks = CGPatternCallbacks(
                version: 0, drawPattern: drawStripes, releaseInfo: nil)
            let patt = CGPattern(info: nil, bounds: CGRect(x: 0,y: 0,width: 4,height: 4),
                                       matrix: CGAffineTransform.identity, xStep: 4, yStep: 4,
                                       tiling: .constantSpacingMinimalDistortion,
                                       isColored: true, callbacks: &callbacks)
            var alph : CGFloat = 1.0
            con.setFillPattern(patt!, colorComponents: &alph)
            
            
            con.move(to: CGPoint(x: 80, y: 25))
            con.addLine(to: CGPoint(x: 100, y: 0))
            con.addLine(to: CGPoint(x: 120, y: 25))
            con.fillPath()
            
            
        case 7:
            let con = UIGraphicsGetCurrentContext()!
            self.arrow.draw(at: CGPoint(x: 0,y: 0))
            for _ in 0..<3 {
                con.translateBy(x: 20, y: 100)
                con.rotate(by: 30 * CGFloat(M_PI)/180.0)
                con.translateBy(x: -20, y: -100)
                self.arrow.draw(at: CGPoint(x: 0,y: 0))
            }
            

        case 8:
            let con = UIGraphicsGetCurrentContext()!
            con.setShadow(offset: CGSize(width: 7, height: 7), blur: 12)
            
            self.arrow.draw(at: CGPoint(x: 0,y: 0))
            for _ in 0..<3 {
                con.translateBy(x: 20, y: 100)
                con.rotate(by: 30 * CGFloat(M_PI)/180.0)
                con.translateBy(x: -20, y: -100)
                self.arrow.draw(at: CGPoint(x: 0,y: 0))
            }
        case 9:
            let con = UIGraphicsGetCurrentContext()!
            con.setShadow(offset: CGSize(width: 7, height: 7), blur: 12)
            
            con.beginTransparencyLayer(auxiliaryInfo: nil)
            self.arrow.draw(at: CGPoint(x: 0,y: 0))
            for _ in 0..<3 {
                con.translateBy(x: 20, y: 100)
                con.rotate(by: 30 * CGFloat(M_PI)/180.0)
                con.translateBy(x: -20, y: -100)
                self.arrow.draw(at: CGPoint(x: 0,y: 0))
            }
            con.endTransparencyLayer()
        case 10:
            let con = UIGraphicsGetCurrentContext()!
            con.setFillColor(UIColor.blue.cgColor)
            con.fill(rect)
            con.clear(CGRect(x: 0,y: 0,width: 30,height: 30))

        default: break
        }
    }

    func arrowImage () -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 40,height: 100), false, 0.0)
        
        // obtain the current graphics context
        let con = UIGraphicsGetCurrentContext()!
        con.saveGState()
        
        // punch triangular hole in context clipping region
        con.move(to: CGPoint(x: 10, y: 100))
        con.addLine(to: CGPoint(x: 20, y: 90))
        con.addLine(to: CGPoint(x: 30, y: 100))
        con.closePath()
        con.addRect(con.boundingBoxOfClipPath)
        CGContextEOClip(con)
        
        // draw the vertical line, add its shape to the clipping region
        con.move(to: CGPoint(x: 20, y: 100))
        con.addLine(to: CGPoint(x: 20, y: 19))
        con.setLineWidth(20)
        con.replacePathWithStrokedPath()
        con.clip()
        
        // draw the gradient
        let locs : [CGFloat] = [ 0.0, 0.5, 1.0 ]
        let colors : [CGFloat] = [
            0.8, 0.4, // starting color, transparent light gray
            0.1, 0.5, // intermediate color, darker less transparent gray
            0.8, 0.4, // ending color, transparent light gray
        ]
        let sp = CGColorSpaceCreateDeviceGray()
        let grad =
            CGGradient (colorSpace: sp, colorComponents: colors, locations: locs, count: 3)
        con.drawLinearGradient (grad!, start: CGPoint(x: 9,y: 0), end: CGPoint(x: 31,y: 0), options: [])
        
        con.restoreGState() // done clipping
        
        // draw the red triangle, the point of the arrow
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 4,height: 4), false, 0)
        let imcon = UIGraphicsGetCurrentContext()!
        imcon.setFillColor(UIColor.red.cgColor)
        imcon.fill(CGRect(x: 0,y: 0,width: 4,height: 4))
        imcon.setFillColor(UIColor.blue.cgColor)
        imcon.fill(CGRect(x: 0,y: 0,width: 4,height: 2))
        let stripes = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let stripesPattern = UIColor(patternImage:stripes!)
        stripesPattern.setFill()
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0,y: 25))
        p.addLine(to: CGPoint(x: 20,y: 0))
        p.addLine(to: CGPoint(x: 40,y: 25))
        p.fill()
        
        let im = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return im!
        
    }

}
