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

        self.view.backgroundColor = UIColor.white
        let slide = UISlider()
        
        self.view.addSubview(slide)
        
        slide.translatesAutoresizingMaskIntoConstraints = false
        slide.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        slide.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        slide.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -60).isActive = true
        slide.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        slide.addTarget(self, action: #selector(FrozenAnimationViewController.doSlide(_:)), for: .valueChanged)
        slide.backgroundColor = UIColor.clear
        slide.minimumValue = 0.0
        slide.maximumValue = 1.0
        slide.isContinuous = true
        slide.value = 0
        
        CATransaction.setDisableActions(true)
        
        // add view
        self.v = UIView()
        self.view.addSubview(v)
        v.backgroundColor = UIColor.clear
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraint(equalTo: slide.bottomAnchor, constant: 10).isActive = true
        v.widthAnchor.constraint(equalToConstant: 200).isActive = true
        v.heightAnchor.constraint(equalToConstant: 200).isActive = true
        v.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0.0).isActive = true
        
        // add shape sublayer
        self.shape = CAShapeLayer()
        self.v.layer.addSublayer(shape)
    }

    override func viewDidLayoutSubviews() {
        print(self.v.bounds)
        
        self.shape.frame = self.v.bounds
        
        self.shape.fillColor = UIColor.clear.cgColor
        self.shape.strokeColor = UIColor.red.cgColor
        // self.shape.lineWidth = 4.0
        
        let path = CGPath(rect: shape.bounds, transform: nil)
        self.shape.path = path
        
        let path2 = CGPath(ellipseIn: shape.bounds, transform: nil)
        let ba = CABasicAnimation(keyPath: "path")
        ba.duration = 1
        ba.fromValue = path
        ba.toValue = path2
        
        shape.speed = 0
        shape.timeOffset = 0
        shape.add(ba, forKey: nil)
        shape.opacity = 1.0
    }
    
    func doSlide(_ sender: UISlider!) {
        print(sender.value)
        self.shape.timeOffset = Double(sender.value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
