import UIKit

class Smiler:NSObject {
    override func drawLayer(_ layer: CALayer, inContext ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        //[[UIImage imageNamed: @"smiley"] drawInRect:CGContextGetClipBoundingBox(ctx)];
        UIImage(named:"smiley")!.draw(at: CGPoint())
        UIGraphicsPopContext()
        print("\(#function)")
        print(layer.contentsGravity)
    }
}

class Smiler2:NSObject {
    override func displayLayer(_ layer: CALayer) {
        layer.contents = UIImage(named:"smiley")!.cgImage
        print("\(#function)")
        print(layer.contentsGravity)
    }
}

class SmilerLayer:CALayer {
    override func draw(in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        //[[UIImage imageNamed: @"smiley"] drawInRect:CGContextGetClipBoundingBox(ctx)];
        UIImage(named:"smiley")!.draw(at: CGPoint())
        UIGraphicsPopContext()
        print("\(#function)")
        print(self.contentsGravity)
    }
}

class SmilerLayer2:CALayer {
    override func display() {
        self.contents = UIImage(named:"smiley")!.cgImage
        print("\(#function)")
        print(self.contentsGravity)
    }
}

