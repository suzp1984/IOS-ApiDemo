//
//  ThirdPresentViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/25/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class ThirdPresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.redColor()
        
        let button = UIButton(type: .System)
        button.setTitle("dismiss", forState: .Normal)
        button.addTarget(self, action: #selector(ThirdPresentViewController.doDismiss(_:)), forControlEvents: .TouchUpInside)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
            button.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
            button.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor)
            ])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doDismiss(sender: UIButton) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

}