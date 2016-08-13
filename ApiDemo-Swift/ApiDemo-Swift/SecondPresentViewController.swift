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
        
        let presentButton = UIButton(type: .System)
        presentButton.setTitle("start Third Controller", forState: .Normal)
        presentButton.addTarget(self, action: #selector(SecondPresentViewController.startThird(_:)), forControlEvents: .TouchUpInside)
        presentButton.setTitleColor(UIColor.yellowColor(), forState: .Normal)
        
        self.view.addSubview(presentButton)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
            presentButton.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
            presentButton.bottomAnchor.constraintEqualToAnchor(button.topAnchor, constant: -20)
            ])
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.delegate?.acceptData("Test")
    }
    
    func doDismiss(sender: UIButton) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func startThird(sender: UIButton) {
        let third = ThirdPresentViewController()
        self.definesPresentationContext = true
        third.modalPresentationStyle = .CurrentContext
        third.modalTransitionStyle = .FlipHorizontal
        self.presentViewController(third, animated: true, completion: nil)
    }

}
