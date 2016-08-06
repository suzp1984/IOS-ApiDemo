//
//  StepperViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 8/6/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class StepperViewController: UIViewController {

    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stepper)
        NSLayoutConstraint.activateConstraints([
                stepper.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                stepper.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor, constant: -20)
            ])
        
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 1
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        self.label = label
        
        NSLayoutConstraint.activateConstraints([
                label.topAnchor.constraintEqualToAnchor(self.topLayoutGuide.bottomAnchor, constant: 20),
                label.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor, constant: 20)
            ])
        
        stepper.addTarget(self, action: #selector(StepperViewController.stepperEvent(_:)), forControlEvents: .ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func stepperEvent(sender: UIStepper) {
        self.label.text = String(sender.value)
    }
}
