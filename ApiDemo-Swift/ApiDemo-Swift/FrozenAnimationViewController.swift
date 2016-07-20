//
//  FrozenAnimationViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/20/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class FrozenAnimationViewController: UIViewController {

    var shape : CAShapeLayer!
    var v : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        let slide = UISlider()
        
        self.view.addSubview(slide)
        
        slide.translatesAutoresizingMaskIntoConstraints = false
        slide.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 10).active = true
        slide.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 30).active = true
        slide.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, constant: -60).active = true
        slide.heightAnchor.constraintEqualToConstant(20.0).active = true
        
        slide.addTarget(self, action: #selector(FrozenAnimationViewController.doSlide(_:)), forControlEvents: .ValueChanged)
        slide.backgroundColor = UIColor.clearColor()
        slide.minimumValue = 0.0
        slide.maximumValue = 1.0
        slide.continuous = true
        slide.value = 0
        
        CATransaction.setDisableActions(true)
        
        // add view
        self.v = UIView()
        self.view.addSubview(v)
        v.backgroundColor = UIColor.clearColor()
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraintEqualToAnchor(slide.bottomAnchor, constant: 10).active = true
        v.widthAnchor.constraintEqualToConstant(200).active = true
        v.heightAnchor.constraintEqualToConstant(200).active = true
        v.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: 0.0).active = true
    }

    override func viewDidLayoutSubviews() {
        print(self.v.bounds)
        
        // add shape sublayer
        self.shape = CAShapeLayer()
        self.shape.frame = self.v.bounds
        
        v.layer.addSublayer(shape)
        
        self.shape.fillColor = UIColor.clearColor().CGColor
        self.shape.strokeColor = UIColor.redColor().CGColor
        // self.shape.lineWidth = 4.0
        
        let path = CGPathCreateWithRect(shape.bounds, nil)
        self.shape.path = path
        
        let path2 = CGPathCreateWithEllipseInRect(shape.bounds, nil)
        let ba = CABasicAnimation(keyPath: "path")
        ba.duration = 1
        ba.fromValue = path
        ba.toValue = path2
        
        shape.speed = 0
        shape.timeOffset = 0
        shape.addAnimation(ba, forKey: nil)
        shape.opacity = 1.0
    }
    
    func doSlide(sender: UISlider!) {
        print(sender.value)
        self.shape.timeOffset = Double(sender.value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
