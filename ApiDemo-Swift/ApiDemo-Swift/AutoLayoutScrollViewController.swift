//
//  AutoLayoutScrollViewController.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/26/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class AutoLayoutScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let sv = UIScrollView()
        sv.backgroundColor = UIColor.greenColor()
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        var constraints = [NSLayoutConstraint]()
        constraints.append(sv.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor))
        constraints.append(sv.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor))
        constraints.append(sv.topAnchor.constraintEqualToAnchor(self.view.topAnchor))
        constraints.append(sv.bottomAnchor.constraintEqualToAnchor(self.bottomLayoutGuide.topAnchor))
        
        var previousLab : UILabel? = nil
        
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.text = "This is Label \(i+1)"
            sv.addSubview(lab)
            constraints.append(lab.leftAnchor.constraintEqualToAnchor(sv.leftAnchor, constant: 10))
            if let previousLab = previousLab {
                constraints.append(lab.topAnchor.constraintEqualToAnchor(previousLab.bottomAnchor, constant: 10))
            } else {
                constraints.append(lab.topAnchor.constraintEqualToAnchor(sv.topAnchor, constant: 10))
            }
            
            previousLab = lab
        }
        
        if let previousLab = previousLab {
        constraints.append(previousLab.bottomAnchor.constraintEqualToAnchor(sv.bottomAnchor, constant: -10))
        }
        
        NSLayoutConstraint.activateConstraints(constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
