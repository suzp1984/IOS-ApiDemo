//
//  OperationMandelbrotView.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/3/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class OperationMandelbrotView: UIView {

    var bitmapContext: CGContext!
    var odd = false
    
    let queue : OperationQueue = {
        let q = OperationQueue()
        q.maxConcurrentOperationCount = 1
        return q
    }()
    
    func drawThatPuppy () {
        let center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        let op = MandelbrotOperation(size: self.bounds.size, center: center, zoom: 1)
        NotificationCenter.default.addObserver(self, selector: #selector(operationFinished), name: NSNotification.Name(rawValue: "MyMandelbrotOperationFinished"), object: op)
        self.queue.addOperation(op)
    }
    
    // warning! called on background thread
    func operationFinished(_ n:Notification) {
        if let op = n.object as? MandelbrotOperation {
            DispatchQueue.main.async {
                NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "MyMandelbrotOperationFinished"), object: op)
                self.bitmapContext = op.bitmapContext
                self.setNeedsDisplay()
            }
        }
    }
    
    // turn pixels of self.bitmapContext into CGImage, draw into ourselves
    override func draw(_ rect: CGRect) {
        if self.bitmapContext != nil {
            let context = UIGraphicsGetCurrentContext()!
            let im = self.bitmapContext.makeImage()
            context.draw(im!, in: self.bounds)
            self.odd = !self.odd
            self.backgroundColor = self.odd ? UIColor.green : UIColor.red
        }
    }
    
    deinit {
        self.queue.cancelAllOperations()
    }

}
