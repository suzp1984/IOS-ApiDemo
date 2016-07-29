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
                    indicator.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -30),
                    indicator.widthAnchor.constraintEqualToConstant(50),
                    indicator.heightAnchor.constraintEqualToConstant(50)
                ])
            indicator.startAnimating()
        }
        
        isIndicator = !isIndicator
    }

}
