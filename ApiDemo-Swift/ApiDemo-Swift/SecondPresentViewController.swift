//
//  SecondPresentViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/25/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

protocol SecondPresentControllerDelegate : class {
    func acceptData(data: AnyObject!)
}

class SecondPresentViewController: UIViewController {

    weak var delegate : SecondPresentControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blueColor()
        
        let button = UIButton(type: .System)
        button.setTitle("dismiss", forState: .Normal)
        button.addTarget(self, action: #selector(SecondPresentViewController.doDismiss(_:)), forControlEvents: .TouchUpInside)
        button.setTitleColor(UIColor.yellowColor(), forState: .Normal)
        
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
        // self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        self.delegate?.acceptData("Do Dismiss")
    }

}
