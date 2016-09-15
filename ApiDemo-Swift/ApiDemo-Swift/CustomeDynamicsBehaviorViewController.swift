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

        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .system)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: UIControlState())
        button.addTarget(self, action: #selector(DynamicsViewController.start), for: .touchUpInside)
        button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        self.iv = MyIV(image: UIImage(named: "Mars"))
        self.iv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.iv)
        self.iv.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        self.iv.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        // self.iv.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.iv.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.iv.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.anim = UIDynamicAnimator(referenceView: self.view)
        self.anim.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start(_ sender: UIButton) {
        sender.isEnabled = false
        
        self.anim.addBehavior(MyDropBounceAndRollBehavior(view:self.iv))
    }
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        print("pause")
    }
    
    func dynamicAnimatorWillResume(_ animator: UIDynamicAnimator) {
        print("resume")
    }

}
