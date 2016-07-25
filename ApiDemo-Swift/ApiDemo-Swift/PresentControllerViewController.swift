//
//  PresentControllerViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/25/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class PresentControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let button = UIButton(type: .System)
        button.setTitle("Present", forState: .Normal)
        button.addTarget(self, action: #selector(PresentControllerViewController.doPresent(_:)), forControlEvents: .TouchUpInside)
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

    func doPresent(sender: UIButton) -> Void {
        let svc = SecondPresentViewController()
        self.presentViewController(svc, animated: true, completion: nil)
    }
}
