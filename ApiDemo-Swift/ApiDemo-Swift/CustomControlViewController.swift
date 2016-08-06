//
//  CustomControlViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class CustomControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let knob = MyKnob()
        knob.backgroundColor = UIColor.clearColor()
        knob.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(knob)
        
        NSLayoutConstraint.activateConstraints([
                knob.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor),
                knob.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor),
                knob.widthAnchor.constraintEqualToConstant(150),
                knob.heightAnchor.constraintEqualToConstant(150)
            ])
        
        knob.addTarget(self, action: #selector(CustomControlViewController.handleKnobRotate(_:)), forControlEvents: .ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handleKnobRotate(sender: MyKnob) {
        print(sender.angle)
    }
}
