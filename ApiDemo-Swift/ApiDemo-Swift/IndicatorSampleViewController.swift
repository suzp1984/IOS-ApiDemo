//
//  IndicatorSampleViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/29/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class IndicatorSampleViewController: UIViewController {

    var isIndicator : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = UIButton(type: .System)
        button.setTitle("Toggle Indicator", forState: .Normal)
        button.addTarget(self, action: #selector(IndicatorSampleViewController.toggleIndicator(_:)), forControlEvents: .TouchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        NSLayoutConstraint.activateConstraints([
                button.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 30),
                button.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        // custome indicator
        let lay = CAReplicatorLayer()
        lay.frame = CGRectMake(0, 0, 100, 20)
        let bar = CALayer()
        bar.frame = CGRectMake(0, 0, 10, 20)
        bar.backgroundColor = UIColor.redColor().CGColor
        lay.addSublayer(bar)
        lay.instanceCount = 5
        lay.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)
        let anim = CABasicAnimation(keyPath: "opacity")
        anim.fromValue = 1.0
        anim.toValue = 0.2
        anim.duration = 1.0
        anim.repeatCount = Float.infinity
        bar.addAnimation(anim, forKey: nil)
        lay.instanceDelay = anim.duration / Double(lay.instanceCount)
        self.view.layer.addSublayer(lay)
        lay.position = CGPointMake(self.view.layer.bounds.midX, self.view.layer.bounds.midY)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleIndicator(sender: UIButton) {
        if isIndicator {
            if let v = self.view.viewWithTag(1001) {
                v.removeFromSuperview()
            }
        } else {
            let indicator = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
            indicator.color = UIColor.yellowColor()
            indicator.backgroundColor = UIColor(white: 0.2, alpha: 0.6)
            indicator.layer.cornerRadius = 5
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.tag = 1001
            indicator.hidesWhenStopped = true
            self.view.addSubview(indicator)
            
            NSLayoutConstraint.activateConstraints([
                    indicator.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 30),
                    indicator.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -30)
//                    indicator.widthAnchor.constraintEqualToConstant(50),
//                    indicator.heightAnchor.constraintEqualToConstant(50)
                ])
            indicator.startAnimating()
        }
        
        isIndicator = !isIndicator
    }

}
