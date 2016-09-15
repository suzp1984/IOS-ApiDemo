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

        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .system)
        button.setTitle("Start", for: UIControlState())
        button.addTarget(self, action: #selector(CIFilterTransitionViewController.start), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        let v = UIView()
        self.view.addSubview(v)
        v.backgroundColor = UIColor.red
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        v.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0).isActive = true
        v.widthAnchor.constraint(equalToConstant: 240.0).isActive = true
        v.heightAnchor.constraint(equalToConstant: 240.0).isActive = true
        
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
        let cicol = CIColor(color:UIColor.red)
        col.setValue(cicol, forKey:"inputColor")
        let colorimage = col.value(forKey: "outputImage") as! CIImage
        
        let tran = CIFilter(name:"CIFlashTransition")!
        tran.setValue(colorimage, forKey:"inputImage")
        tran.setValue(moi, forKey:"inputTargetImage")
        let center = CIVector(x:self.moiextent.width/2.0, y:self.moiextent.height/2.0)
        tran.setValue(center, forKey:"inputCenter")
        
        self.tran = tran
        self.timestamp = 0.0 // signal that we are starting
        self.context = CIContext(options:nil)
        
        DispatchQueue.main.async {
            
            let link = CADisplayLink(target:self, selector:#selector(self.nextFrame))
            link.add(to: RunLoop.main, forMode:RunLoopMode.defaultRunLoopMode)
            
        }
    }
    
    func nextFrame(_ sender:CADisplayLink) {
        if self.timestamp < 0.01 { // pick up and store first timestamp
            self.timestamp = sender.timestamp
            self.frame = 0.0
        } else { // calculate frame
            self.frame = (sender.timestamp - self.timestamp) * SCALE
        }
        sender.isPaused = true // defend against frame loss
        
        self.tran.setValue(self.frame, forKey:"inputTime")
        let moi = self.context.createCGImage(tran.outputImage!, from:self.moiextent)
        CATransaction.setDisableActions(true)
        self.v.layer.contents = moi
        
        if self.frame > 1.0 {
            print("invalidate")
            sender.invalidate()
        }
        sender.isPaused = false
        
        print("here \(self.frame)") // useful for seeing dropped frame rate
    }

}
