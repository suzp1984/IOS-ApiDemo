//
//  UIViewTransitionViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/2/16.
//  Copyright © 2016 iboxpay. All rights reserved.
//

import UIKit

class UIViewTransitionViewController: UIViewController {

    var iv : UIImageView!
    var reverse : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        iv = UIImageView(image: UIImage(named: "Mars"))
        self.view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        iv.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor).active = true
        iv.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 50).active = true
        iv.widthAnchor.constraintEqualToConstant(150).active = true
        iv.heightAnchor.constraintEqualToConstant(150).active = true
        
        let button = UIButton(type: .System)
        button.setTitle("Transite", forState: UIControlState.Normal)
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20).active = true
        button.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -20).active = true
        button.addTarget(self, action: #selector(UIViewTransitionViewController.animate), forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animate() -> Void {
        let opts : UIViewAnimationOptions = .TransitionFlipFromLeft
        UIView.transitionWithView(self.iv, duration: 2.0, options: opts, animations: {
                if (self.reverse) {
                    self.iv.image = UIImage(named: "Mars")
                } else {
                    self.iv.image = UIImage(named: "Moi")
                }
            
                self.reverse = !self.reverse
            }, completion: nil)
    }
}
