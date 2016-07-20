//
//  LayerTransitionViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/20/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class LayerTransitionViewController: UIViewController {

    var v : UIView!
    var layer : CALayer!
    var isMars : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.v = UIView()
        self.view.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 100).active = true
        v.widthAnchor.constraintEqualToConstant(100.0).active = true
        v.heightAnchor.constraintEqualToConstant(100.0).active = true
        v.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: 0.0).active = true
        
        let button = UIButton(type: .System)
        button.setTitle("Start", forState: .Normal)
        button.addTarget(self, action: #selector(LayerTransitionViewController.startTransition), forControlEvents: .TouchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 10).active = true
        button.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 10).active = true
        
        self.layer = CALayer()
        self.v.layer.addSublayer(layer)
    }
    
    override func viewDidLayoutSubviews() {
        print("View Did LayoutSubViews")
        
        self.layer.frame = self.v.layer.bounds
        // Do not add sublayer in viewDidLayoutSubViews method
        // v.layer.addSublayer(layer)
        self.isMars = true
        layer.contents = UIImage(named: "Mars")?.CGImage
        layer.contentsGravity = kCAGravityResizeAspectFill
        v.layer.masksToBounds = false // try making this false to see what difference it makes
        v.layer.borderWidth = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func startTransition() {
        
        let t = CATransition()
        t.type = kCATransitionPush
        t.subtype = kCATransitionFromBottom
        t.duration = 2
        CATransaction.setDisableActions(true)
        if (self.isMars) {
            self.layer.contents = UIImage(named: "smiley")?.CGImage
        } else {
            self.layer.contents = UIImage(named: "Mars")?.CGImage
        }
        
        self.isMars = !self.isMars
        
        self.layer.addAnimation(t, forKey: nil)
    }
}
