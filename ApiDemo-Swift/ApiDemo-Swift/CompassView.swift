
import UIKit


extension CGRect {
    var center : CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}

// view exists solely to host layer
class CompassView : UIView {
    override class var layerClass : AnyClass {
        return CompassLayer.self
    }
}

class CompassLayer : CALayer, CALayerDelegate {
    var arrow : CALayer?
    var didSetup = false
    
    override func layoutSublayers() {
        if !self.didSetup {
            self.didSetup = true
            self.setup()
        }
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    func setup () {
        print("setup")
        
        // the gradient
        let g = CAGradientLayer()
        g.contentsScale = UIScreen.main.scale
        g.frame = self.bounds
        g.colors = [
            UIColor.black.cgColor,
            UIColor.red.cgColor
        ]
        g.locations = [0.0,1.0]
        self.addSublayer(g)
        
        // the circle
        let circle = CAShapeLayer()
        circle.contentsScale = UIScreen.main.scale
        circle.lineWidth = 2.0
        circle.fillColor = UIColor(red:0.9, green:0.95, blue:0.93, alpha:0.9).cgColor
        circle.strokeColor = UIColor.gray.cgColor
        let p = CGMutablePath()
        p.addEllipse(in: self.bounds.insetBy(dx: 3, dy: 3))
        circle.path = p
        self.addSublayer(circle)
        circle.bounds = self.bounds
        circle.position = self.bounds.center
        
        // the four cardinal points
        let pts = "NESW"
        for (ix,c) in pts.characters.enumerated() {
            let t = CATextLayer()
            t.contentsScale = UIScreen.main.scale
            t.string = String(c)
            t.bounds = CGRect(x: 0,y: 0,width: 40,height: 40)
            t.position = circle.bounds.center
            let vert = circle.bounds.midY / t.bounds.height
            t.anchorPoint = CGPoint(x: 0.5, y: vert)
            //print(t.anchorPoint)
            t.alignmentMode = kCAAlignmentCenter
            t.foregroundColor = UIColor.black.cgColor
            t.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(ix)*CGFloat(M_PI)/2.0))
            circle.addSublayer(t)
        }
        
        
        // the arrow
        let arrow = CALayer()
        arrow.contentsScale = UIScreen.main.scale
        arrow.bounds = CGRect(x: 0, y: 0, width: 40, height: 100)
        arrow.position = self.bounds.center
        arrow.anchorPoint = CGPoint(x: 0.5, y: 0.8)
        arrow.delegate = self // we will draw the arrow in the delegate method
        // in Swift, not a property:
        arrow.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(M_PI)/5.0))
        self.addSublayer(arrow)
        arrow.setNeedsDisplay() // draw, please
        
        // uncomment next line (only) for contentsCenter and contentsGravity
        // delay (0.4) {self.resizeArrowLayer(arrow)}
        
        // uncomment next line (only) for layer mask
        // self.mask(arrow)
        
        
        self.arrow = arrow
        
    }
    
    func draw(_ layer: CALayer, in con: CGContext) {
        print("drawLayer:inContext: for arrow")
        
        // Questa poi la conosco pur troppo!
        
        // punch triangular hole in context clipping region
        con.move(to: CGPoint(x: 10, y: 100))
        con.addLine(to: CGPoint(x: 20, y: 90))
        con.addLine(to: CGPoint(x: 30, y: 100))
        con.closePath()
        con.addRect(con.boundingBoxOfClipPath)
        con.clip()
        
        // draw the vertical line, add its shape to the clipping region
        con.move(to: CGPoint(x: 20, y: 100))
        con.addLine(to: CGPoint(x: 20, y: 19))
        con.setLineWidth(20)
        con.strokePath()
        
        // draw the triangle, the point of the arrow
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 4,height: 4), false, 0)
        let imcon = UIGraphicsGetCurrentContext()!
        imcon.setFillColor(UIColor.red.cgColor)
        imcon.fill(CGRect(x: 0,y: 0,width: 4,height: 4))
        imcon.setFillColor(UIColor.blue.cgColor)
        imcon.fill(CGRect(x: 0,y: 0,width: 4,height: 2))
        let stripes = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let stripesPattern = UIColor(patternImage:stripes!)
        
        UIGraphicsPushContext(con)
        stripesPattern.setFill()
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 0,y: 25))
        p.addLine(to: CGPoint(x: 20,y: 0))
        p.addLine(to: CGPoint(x: 40,y: 25))
        p.fill()
        UIGraphicsPopContext()
        
    }
    
    func resizeArrowLayer(_ arrow:CALayer) {
        print("resize arrow")
        arrow.needsDisplayOnBoundsChange = false
        arrow.contentsCenter = CGRect(x: 0.0, y: 0.4, width: 1.0, height: 0.6)
        arrow.contentsGravity = kCAGravityResizeAspect
        // arrow.bounds.insetInPlace(dx: -20, dy: -20)
        arrow.bounds.insetBy(dx: -20, dy: -20)
    }
    
    func mask(_ arrow:CALayer) {
        let mask = CAShapeLayer()
        mask.frame = arrow.bounds
        let path = CGMutablePath()
        path.addEllipse(in: mask.bounds.insetBy(dx: 10, dy: 10))
        // CGPathAddEllipseInRect(path, nil, mask.bounds.insetBy(dx: 10, dy: 10))
        mask.strokeColor = UIColor(white:0.0, alpha:0.5).cgColor
        mask.lineWidth = 20
        mask.path = path
        arrow.mask = mask
    }
    
}
