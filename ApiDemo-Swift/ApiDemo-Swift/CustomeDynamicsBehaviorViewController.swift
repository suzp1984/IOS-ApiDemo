//
//  CustomeDynamicsBehaviorViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/22/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class CustomeDynamicsBehaviorViewController: UIViewController, UIDynamicAnimatorDelegate {

    var iv : MyIV!
    var anim : UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = UIButton(type: .System)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", forState: .Normal)
        button.addTarget(self, action: #selector(DynamicsViewController.start), forControlEvents: .TouchUpInside)
        button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20).active = true
        button.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20).active = true
        
        self.iv = MyIV(image: UIImage(named: "Mars"))
        self.iv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.iv)
        self.iv.topAnchor.constraintEqualToAnchor(button.bottomAnchor, constant: 20).active = true
        self.iv.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        // self.iv.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.iv.widthAnchor.constraintEqualToConstant(100).active = true
        self.iv.heightAnchor.constraintEqualToConstant(100).active = true
        
        self.anim = UIDynamicAnimator(referenceView: self.view)
        self.anim.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start(sender: UIButton) {
        sender.enabled = false
        
        self.anim.addBehavior(MyDropBounceAndRollBehavior(view:self.iv))
    }
    
    func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
        print("pause")
    }
    
    func dynamicAnimatorWillResume(animator: UIDynamicAnimator) {
        print("resume")
    }

}
