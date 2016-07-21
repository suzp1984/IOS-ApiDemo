//
//  CIFilterTransitionViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/21/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class CIFilterTransitionViewController: UIViewController {

    var v : UIView!
    var tran : CIFilter!
    var moiextent : CGRect!
    var frame : Double!
    
    var timestamp: CFTimeInterval!
    var context : CIContext!
    
    let SCALE = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = UIButton(type: .System)
        button.setTitle("Start", forState: .Normal)
        button.addTarget(self, action: #selector(CIFilterTransitionViewController.start), forControlEvents: .TouchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20).active = true
        button.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20).active = true
        
        let v = UIView()
        self.view.addSubview(v)
        v.backgroundColor = UIColor.redColor()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraintEqualToAnchor(button.bottomAnchor, constant: 20).active = true
        v.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: 0.0).active = true
        v.widthAnchor.constraintEqualToConstant(240.0).active = true
        v.heightAnchor.constraintEqualToConstant(240.0).active = true
        
        self.v = v
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func start() -> Void {
        let moi = CIImage(image:UIImage(named:"Moi")!)!
        self.moiextent = moi.extent
        
        let col = CIFilter(name:"CIConstantColorGenerator")!
        let cicol = CIColor(color:UIColor.redColor())
        col.setValue(cicol, forKey:"inputColor")
        let colorimage = col.valueForKey("outputImage") as! CIImage
        
        let tran = CIFilter(name:"CIFlashTransition")!
        tran.setValue(colorimage, forKey:"inputImage")
        tran.setValue(moi, forKey:"inputTargetImage")
        let center = CIVector(x:self.moiextent.width/2.0, y:self.moiextent.height/2.0)
        tran.setValue(center, forKey:"inputCenter")
        
        self.tran = tran
        self.timestamp = 0.0 // signal that we are starting
        self.context = CIContext(options:nil)
        
        dispatch_async(dispatch_get_main_queue()) {
            
            let link = CADisplayLink(target:self, selector:#selector(self.nextFrame))
            link.addToRunLoop(NSRunLoop.mainRunLoop(), forMode:NSDefaultRunLoopMode)
            
        }
    }
    
    func nextFrame(sender:CADisplayLink) {
        if self.timestamp < 0.01 { // pick up and store first timestamp
            self.timestamp = sender.timestamp
            self.frame = 0.0
        } else { // calculate frame
            self.frame = (sender.timestamp - self.timestamp) * SCALE
        }
        sender.paused = true // defend against frame loss
        
        self.tran.setValue(self.frame, forKey:"inputTime")
        let moi = self.context.createCGImage(tran.outputImage!, fromRect:self.moiextent)
        CATransaction.setDisableActions(true)
        self.v.layer.contents = moi
        
        if self.frame > 1.0 {
            print("invalidate")
            sender.invalidate()
        }
        sender.paused = false
        
        print("here \(self.frame)") // useful for seeing dropped frame rate
    }

}
